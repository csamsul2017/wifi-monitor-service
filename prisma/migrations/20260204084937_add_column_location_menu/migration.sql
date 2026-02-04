/*
  Warnings:

  - Added the required column `location` to the `customer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `menu` to the `customer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "customer" ADD COLUMN     "location" TEXT NOT NULL,
ADD COLUMN     "menu" TEXT NOT NULL;
