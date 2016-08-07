Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=rjDBVmc8Xcl2fhGseMUss0tX1knLWXnAL5AvnGo4zJM=;
 b=fL8dBUOAGsnUpE1d/cJRMnVuCUWVacpShANxi7vfPXaYn8Jf34dqTfj5JqeZ6dH+t0
 16SCWl2+Mme1UoSgwScbXvlnjkZ6bIE2+0FBPzWaOcvXYIZSNb9Uz++5jSjafEBLibr3
 dwTB/RtLszOOnaQSyBIbymb4d+mjKLtnONnBDEqhAEneHRohPsj+9Zi9H22uvycuulFY
 uJk1sIDj9D385dggpPsrf5Rx+sh4eGYpi8aEUUrotW9rq0+rmQLfSwxSsBp3JynIsuqy
 tnkQrVWVcTr1W3Q174fw4iplvZ7igcOeZMjiy2Fdz3is4ufSzEsFG+xfj5MpL87NyKRO
 Wy4A==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/3] Polish rcutorture.h
Date: Sun,  7 Aug 2016 12:41:24 +0900
Message-Id: <1470541287-12588-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset contains few fixups for trivial nitpicks of rcutorture.

SeongJae Park (3):
  rcutorture: Update usage
  rcutorture: Remove redundant n_read_pt initialization
  rcutorture: Protect fake workload from compiler optimization

 CodeSamples/defer/rcutorture.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
1.9.1

