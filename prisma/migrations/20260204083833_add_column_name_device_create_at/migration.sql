/*
  Warnings:

  - Added the required column `createAt` to the `customer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `device` to the `customer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `customer` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "customer_email_key";

-- AlterTable
ALTER TABLE "customer" ADD COLUMN     "createAt" TEXT NOT NULL,
ADD COLUMN     "device" TEXT NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL;
