#include <string.h>
#include <stdio.h>
#include <unistd.h>

/* When requesting memory from the OS using sbrk(), request it in
 * increments of CHUNK_SIZE. */
#define CHUNK_SIZE (1<<12)


/*
 * This function, defined in bulk.c, allocates a contiguous memory
 * region of at least size bytes.  It MAY NOT BE USED as the allocator
 * for pool-allocated regions.  Memory allocated using bulk_alloc()
 * must be freed by bulk_free().
 *
 * This function will return NULL on failure.
 */
extern void *bulk_alloc(size_t size);

/*
 * This function is also defined in bulk.c, and it frees an allocation
 * created with bulk_alloc().  Note that the pointer passed to this
 * function MUST have been returned by bulk_alloc(), and the size MUST
 * be the same as the size passed to bulk_alloc() when that memory was
 * allocated.  Any other usage is likely to fail, and may crash your
 * program.
 */
extern void bulk_free(void *ptr, size_t size);

/*
 * This function computes the log base 2 of the allocation block size
 * for a given allocation.  To find the allocation block size from the
 * result of this function, use 1 << block_size(x).
 *
 * Note that its results are NOT meaningful for any
 * size > 4088!
 *
 * You do NOT need to understand how this function works.  If you are
 * curious, see the gcc info page and search for __builtin_clz; it
 * basically counts the number of leading binary zeroes in the value
 * passed as its argument.
 */
static inline __attribute__((unused)) int block_index(size_t x) {
    if (x <= 8) {
        return 5;
    } else {
        return 32 - __builtin_clz((unsigned int)x + 7);
    }
}

/*
 * You must implement malloc().  Your implementation of malloc() must be
 * the multi-pool allocator described in the project handout.
 */
typedef struct block{
    size_t size;
    struct block *next;  //header for the block
}block; 

struct block *FL[64];


static void removeN(int FLindex){
    struct block *next = FL[FLindex]->next;
    FL[FLindex] = next;
}

static void inclist(void *loc, size_t size){
    void *ref = loc;
    size_t BS = 1 << block_index(size);
    int traverse = (CHUNK_SIZE/BS);
    int index = block_index(size);
    for(int i = 0; i < traverse; i++){
        struct block *node = ref;
        node->size = BS;
        node->next = FL[index];
        FL[index] = node;
        ref += BS;
    }
}



void *malloc(size_t size) {
    
    if(size <= 0){
        return NULL;
    }

    if(size > 4088){
        struct block *bulkN = bulk_alloc(size+8);
        bulkN->size = size+8;
        void *RV = (void*)(bulkN);
        RV += sizeof(size_t);
        return RV;
    }
    int LI = block_index(size);
    if(FL[LI] != NULL){
        struct block *FM = FL[LI];
        FM->size += 1;
        removeN(LI);
        void *RV = (void*)(FM);
        RV += sizeof(size_t);
        return RV;
    }
    void *allptr = sbrk(CHUNK_SIZE);
    if(allptr == (void*)-1){
        return NULL;
    }
    inclist(allptr, size);
    struct block *node = FL[LI];
    node->size = size + 1;
    removeN(LI);
    void *RV = (void*)(node);
    RV += sizeof(size_t);
    return RV;
}

/*
 * You must also implement calloc().  It should create allocations
 * compatible with those created by malloc().  In particular, any
 * allocations of a total size <= 4088 bytes must be pool allocated,
 * while larger allocations must use the bulk allocator.
 *
 * calloc() (see man 3 calloc) returns a cleared allocation large enough
 * to hold nmemb elements of size size.  It is cleared by setting every
 * byte of the allocation to 0.  You should use the function memset()
 * for this (see man 3 memset).
 */
void *calloc(size_t nmemb, size_t size) {
    void *ptr = bulk_alloc(nmemb * size);
    memset(ptr, 0, nmemb * size);
    return ptr;
}

/*
 * You must also implement realloc().  It should create allocations
 * compatible with those created by malloc(), honoring the pool
 * alocation and bulk allocation rules.  It must move data from the
 * previously-allocated block to the newly-allocated block if it cannot
 * resize the given block directly.  See man 3 realloc for more
 * information on what this means.
 *
 * It is not possible to implement realloc() using bulk_alloc() without
 * additional metadata, so the given code is NOT a working
 * implementation!
 */
void *realloc(void *ptr, size_t size) {
    fprintf(stderr, "Realloc is not implemented!\n");
    return NULL;
}

/*
 * You should implement a free() that can successfully free a region of
 * memory allocated by any of the above allocation routines, whether it
 * is a pool- or bulk-allocated region.
 *
 * The given implementation does nothing.
 */
void free(void *ptr) {
    return;
}
