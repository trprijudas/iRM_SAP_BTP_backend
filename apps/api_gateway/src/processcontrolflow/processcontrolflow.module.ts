import { Module } from '@nestjs/common';
import { AuthModule } from '../auth/src';
import { DashboardController } from './dashboard.controller';
import { DataLoadController } from './dataload.controller';
import { MasterController } from './master.controller';
import { ConfigurationController } from './configuration.controller';
import { MulterModule } from '@nestjs/platform-express';
import { ShareLibModule } from '@app/share_lib';

@Module({
  imports: [
    AuthModule,
    MulterModule.register({
      dest: process.env.UPLOAD_DEST,
    }),
    ShareLibModule
  ],
  controllers: [
    DashboardController,
    DataLoadController,
    MasterController,
    ConfigurationController,
  ],
  providers: [],
  exports: [],
})
export class ProcesscontrolflowModule {}
