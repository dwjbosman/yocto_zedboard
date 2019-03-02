#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <errno.h>
#include <linux/mman.h>

static volatile uint8_t *base_address;

int read_file( char *argv[]) {
	int fd, fd_out;

	off_t size;
	off_t file_index;

	char* fname = 0;
	char* addr = argv[3];
	char* len  = argv[4];

	fname = argv[2];


	fd_out = open(fname, O_RDWR | O_CREAT);
	if (fd_out < 1) {
		printf("Unable to open output file %s\n",fname );
	}

	void* load_address = (void*)strtoul(addr, NULL, 16);
	printf("Loading at address 0x%p\n ",load_address);

	fd = open("/dev/mem", O_RDWR | O_SYNC);

	if (fd < 1) {
		printf("Unable to open mem device file\n");
		close(fd_out);
		return -1;
	}

	// determine size
	size = strtoul(len, NULL, 10);
	printf("Reading %lu bytes\n ",size);


	base_address = mmap(load_address, size, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_UNINITIALIZED | MAP_FIXED, fd, 0);
	if (base_address == MAP_FAILED) {
		printf("mmap failed! %s\n", strerror(errno));
		close(fd);
		close(fd_out);
		return -1;
	}


	for (file_index = 0; file_index < size; file_index++) {
		uint8_t file_byte;
		file_byte = base_address[file_index];
		ssize_t result = write(fd_out, &file_byte,1);

		if (result<0) {
			printf("Error during filewrite: %s", strerror(errno));
			break;
		}

		if ((file_index % 100) == 0) {
			printf(".");
		}
	}
	printf("\n");

	munmap(base_address, size);
	close(fd_out);
	close(fd);
	return 0;
}



int write_file( char *argv[]) {
	int fd, fd_in;

	off_t size;
	off_t file_index;

	char* fname = 0;
	char* addr = argv[3];

	fname = argv[2];


	fd_in = open(fname, O_RDONLY);
	if (fd_in < 1) {
		printf("Unable to open input file %s\n",fname );
	}

	void* load_address = (void*)strtoul(addr, NULL, 16);
	printf("Loading at address %p\n ",load_address);

	fd = open("/dev/mem", O_RDWR | O_SYNC);

	if (fd < 1) {
		printf("Unable to open mem device file\n");
		close(fd_in);
		return -1;
	}

	// determine size
	size = lseek(fd_in, 0L, SEEK_END);
	lseek(fd_in, 0L, SEEK_SET);

	printf("Copying %ld bytes\n", size);

	//size = 0x2000;

	/* Step 4, map the device memory into the process address space so that it can be
 	 * accessed
 	 */

	base_address = mmap(load_address, size, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_UNINITIALIZED | MAP_FIXED, fd, 0);
	if (base_address == MAP_FAILED) {
		printf("mmap failed! %s\n", strerror(errno));
		close(fd);
		close(fd_in);
		return -1;
	}


	for (file_index = 0; file_index < size; file_index++) {
		uint8_t file_byte;
		ssize_t result = read(fd_in, &file_byte,1);

		if (result<0) {
			printf("Error during fileread: %s", strerror(errno));
			break;
		}
		base_address[file_index] = file_byte;

		if (base_address[file_index] != file_byte) {
			printf("Write failed, offset %lx failed\n", file_index);
			break;
		}
		if ((file_index % 100) == 0) {
			printf(".");
		}
	}
	printf("\n");

	munmap(base_address, size);
	close(fd_in);
	close(fd);
	return 0;
}

void usage(void) {
	printf("Usage: [w file.bin addr] [r fname addr len]\n");
	printf("sizeof void* %d\n", sizeof(void*));
	printf("sizeof off_t %d\n", sizeof(off_t));

}

int main(int argc, char *argv[])
{

	printf("ps_mem_util\n");
	if (argc<2) {
		usage();
		return -1;
	}

	if (argv[1][0]=='w') {
		if (argc<4) {
			usage();
		}

		printf("Write file mode\n");
		return  write_file(argv);
	}

	if (argv[1][0]=='r') {
		if (argc<5) {
			usage();
		}
		printf("Read file mode\n");
		return  read_file(argv);
	}

	return 0;

}
