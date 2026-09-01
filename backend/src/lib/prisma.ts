import { setGlobalDispatcher, Agent } from 'undici';
import dns from 'node:dns';

setGlobalDispatcher(new Agent({
  connect: {
    lookup: (hostname: string, options: any, callback: any) => {
      if (typeof options === 'function') {
        callback = options;
        options = {};
      }
      dns.lookup(hostname, { ...options, family: 4 }, (err, address, family) => {
        callback(err, address, family);
      });
    }
  }
}));

import dotenv from 'dotenv';
dotenv.config();

import { PrismaNeonHttp } from '@prisma/adapter-neon';
import { PrismaClient } from '../generated/prisma/client';

const databaseUrl = process.env.DATABASE_URL;
if (!databaseUrl) {
  throw new Error('DATABASE_URL environment variable is not defined.');
}

const adapter = new PrismaNeonHttp(databaseUrl, {});
export const prisma = new PrismaClient({ adapter });
