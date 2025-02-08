/*
  Warnings:

  - A unique constraint covering the columns `[kode]` on the table `menu` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `kode` to the `menu` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `menu_id_key` ON `menu`;

-- AlterTable
ALTER TABLE `menu` ADD COLUMN `kode` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `menu_kode_key` ON `menu`(`kode`);
