/* =========================================================================
 * lv_fs_fatfs.c — LVGL filesystem driver wrapping FatFS
 *
 * Allows LVGL to open, read and seek files on the SD card via FatFS.
 * Driver letter: 'S' (for SD card)
 * Usage in LVGL:  lv_image_set_src(img, "S:/background.bin");
 * ========================================================================= */

#include <lv_fatfs/lv_fs_fatfs.h>
#include "fatfs.h"
#include <string.h>

/* Driver letter LVGL uses to identify this filesystem */
#define FATFS_DRIVER_LETTER  'S'

/* -------------------------------------------------------------------------
 * FatFS callback implementations
 * ------------------------------------------------------------------------- */

static void *fs_open(lv_fs_drv_t *drv, const char *path, lv_fs_mode_t mode)
{
    (void)drv;

    BYTE fatfs_mode = 0;
    if (mode & LV_FS_MODE_RD) fatfs_mode |= FA_READ;
    if (mode & LV_FS_MODE_WR) fatfs_mode |= FA_WRITE | FA_OPEN_ALWAYS;

    FIL *file = lv_malloc(sizeof(FIL));
    if (file == NULL) return NULL;

    FRESULT res = f_open(file, path, fatfs_mode);
    if (res != FR_OK) {
        lv_free(file);
        return NULL;
    }

    return file;
}

static lv_fs_res_t fs_close(lv_fs_drv_t *drv, void *file_p)
{
    (void)drv;
    FIL *file = (FIL *)file_p;
    f_close(file);
    lv_free(file);
    return LV_FS_RES_OK;
}

static lv_fs_res_t fs_read(lv_fs_drv_t *drv, void *file_p,
                            void *buf, uint32_t btr, uint32_t *br)
{
    (void)drv;
    FIL *file = (FIL *)file_p;
    FRESULT res = f_read(file, buf, btr, (UINT *)br);
    return (res == FR_OK) ? LV_FS_RES_OK : LV_FS_RES_UNKNOWN;
}

static lv_fs_res_t fs_write(lv_fs_drv_t *drv, void *file_p,
                             const void *buf, uint32_t btw, uint32_t *bw)
{
    (void)drv;
    FIL *file = (FIL *)file_p;
    FRESULT res = f_write(file, buf, btw, (UINT *)bw);
    return (res == FR_OK) ? LV_FS_RES_OK : LV_FS_RES_UNKNOWN;
}

static lv_fs_res_t fs_seek(lv_fs_drv_t *drv, void *file_p,
                            uint32_t pos, lv_fs_whence_t whence)
{
    (void)drv;
    FIL *file = (FIL *)file_p;

    uint32_t abs_pos = 0;
    switch (whence) {
        case LV_FS_SEEK_SET: abs_pos = pos;                        break;
        case LV_FS_SEEK_CUR: abs_pos = f_tell(file) + pos;        break;
        case LV_FS_SEEK_END: abs_pos = f_size(file) + pos;        break;
        default:             abs_pos = pos;                        break;
    }

    FRESULT res = f_lseek(file, abs_pos);
    return (res == FR_OK) ? LV_FS_RES_OK : LV_FS_RES_UNKNOWN;
}

static lv_fs_res_t fs_tell(lv_fs_drv_t *drv, void *file_p, uint32_t *pos_p)
{
    (void)drv;
    FIL *file = (FIL *)file_p;
    *pos_p = f_tell(file);
    return LV_FS_RES_OK;
}

/* Directory operations (optional — needed for lv_fs_dir_open etc.) */
static void *fs_dir_open(lv_fs_drv_t *drv, const char *path)
{
    (void)drv;
    DIR *dir = lv_malloc(sizeof(DIR));
    if (dir == NULL) return NULL;

    FRESULT res = f_opendir(dir, path);
    if (res != FR_OK) {
        lv_free(dir);
        return NULL;
    }
    return dir;
}

static lv_fs_res_t fs_dir_read(lv_fs_drv_t *drv, void *dir_p,
                                char *fn, uint32_t fn_len)
{
    (void)drv;
    DIR *dir = (DIR *)dir_p;
    FILINFO fno;

    FRESULT res = f_readdir(dir, &fno);
    if (res != FR_OK || fno.fname[0] == '\0') {
        fn[0] = '\0';
        return LV_FS_RES_OK;
    }

    strncpy(fn, fno.fname, fn_len - 1);
    fn[fn_len - 1] = '\0';
    return LV_FS_RES_OK;
}

static lv_fs_res_t fs_dir_close(lv_fs_drv_t *drv, void *dir_p)
{
    (void)drv;
    DIR *dir = (DIR *)dir_p;
    f_closedir(dir);
    lv_free(dir);
    return LV_FS_RES_OK;
}

/* -------------------------------------------------------------------------
 * Register the driver with LVGL
 * Call this AFTER lv_init() and AFTER f_mount()
 * ------------------------------------------------------------------------- */
void lv_fs_fatfs_init(void)
{
    static lv_fs_drv_t drv;
    lv_fs_drv_init(&drv);

    drv.letter    = FATFS_DRIVER_LETTER;
    drv.open_cb   = fs_open;
    drv.close_cb  = fs_close;
    drv.read_cb   = fs_read;
    drv.write_cb  = fs_write;
    drv.seek_cb   = fs_seek;
    drv.tell_cb   = fs_tell;

    drv.dir_open_cb  = fs_dir_open;
    drv.dir_read_cb  = fs_dir_read;
    drv.dir_close_cb = fs_dir_close;

    lv_fs_drv_register(&drv);
}
