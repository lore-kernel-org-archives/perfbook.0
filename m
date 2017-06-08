Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=ELV98D5jB3rIsF31ymmAyzUdc++d7Ze/yYrdcZ4aGM8=;
 b=aoelm6tOpu6Mjy/0bIDyRnRBoHdCfvcwSK+HldZUy+f1fPOk9HeUDDe23YIGc6MwBH
 4mCD874KwuCGb3K9F2OZzhckIqiifhgGLxz/pwlv/kjG3ksPMwG7lIQT6q4jB6idDXry
 VRFY4zamIMVfAMahyf7nsN3TbLYW3hCyAtvxhlW6fjueojU3k2M1BxglBc4PIdm2uxkA
 KMV4OEQ0/RyvTMoplPNjTUkwjNsy0zWjtp7i51UR+rJHsv/liqSG67XPSoKVvOT7qyZk
 gMFsquLp01lvKNeNAf0qck7bpxY/6qF+iS3xX0CeAKWkgKmzjn42DNxm5jkNPr8jqq1l
 UPcw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 0/2] Patches to chapter Deferred Processing
Date: Thu,  8 Jun 2017 11:16:31 +0800
Message-Id: <1496891793-5755-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul and list,

Attached are two patches for routetorture.h. Please take a look.

One of my remaining question is about the two smp_mb() in routetorture.h. Take
the smp_mb() in perftest() as example, my understanding is that it is used to
prevent the access to nthreads_running and access to goflag from being
reorganized. If that's the case, don't we need a paired memory barrier
instruction in perftest_reader()? Specifically, in between line 105
(atomic_inc(&nthreads_running);) and line 106 (gf = READ_ONCE(goflag);). 

Another puzzle is that we are using shared memory 'pap' to transfer statistic
results from working threads, e.g. perftest_reader, to main thread, e.g.
perftest. Do we need a smp_mb() at the tail (before instruction return) of
function perftest_reader to force the results being written before the thread
terminates? In other words, I'm not sure if the two events, writing to shared
memory pap and thread termination, could be reordered.  Hints are welcome!

Thanks,
--Jason

Junchang Wang (2):
  Fix typos in help messages
  routetorture.h: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()

 CodeSamples/defer/routetorture.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
2.7.4

