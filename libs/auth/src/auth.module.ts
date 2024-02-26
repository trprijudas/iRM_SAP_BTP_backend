import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [JwtModule.register({
    secret: 'secret',
    signOptions: { expiresIn: '1h' },
  })],
  providers: [AuthService],
  exports: [AuthService],
})
export class AuthModule {}
