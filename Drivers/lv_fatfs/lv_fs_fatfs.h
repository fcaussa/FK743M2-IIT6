#ifndef LV_FS_FATFS_H
#define LV_FS_FATFS_H

#include "lvgl.h"

/* -------------------------------------------------------------------------
 * lv_fs_fatfs_init()
 *
 * Registers the FatFS filesystem driver with LVGL.
 * Call this AFTER lv_init() and AFTER f_mount() succeeds.
 *
 * After calling this, use driver letter 'S' in LVGL image paths:
 *   lv_image_set_src(img, "S:/image.bin");
 *   lv_image_set_src(img, "S:/folder/photo.bin");
 * ------------------------------------------------------------------------- */
void lv_fs_fatfs_init(void);

#endif /* LV_FS_FATFS_H */
