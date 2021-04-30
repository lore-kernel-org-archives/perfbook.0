Return-Path: <SRS0=Nnbh=J3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=jp5VNw/dGdXDrqmef21ysFUOms28L0fGcDyOmY7uzFs=;
        b=ungow4yd7n9tuVjOc4jZ3iO6PrGKEVSal8WyS/QjrITWZph5UmI7i2n3fLysMIq2bD
         Ek3XTji2BZ+j8lFwRr5dsYr/7DfdYWmT+6sU0dM28bCPELF5g/oNMNO1o/meAvgp+6OZ
         RY7zO1G3m6/H6K8V1AcCNN7i78KbqDv0aWyySvlwe0szfieGNOqNhCye4GrdhB4jBwT4
         IuZXq4PWqOfQ5aAFvtctOtmt0Tl3ITtJKfS5HRhxy03CAS+DUMnwf4V4bXJmumf2sPcA
         v+rNEyBoxbkWAeVHA/v68RJwKaDQRlA4wr69jWrpFRADxa5xQBy3GiQRKmvB7YZXAWvY
         CMDw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/4] periodcheck and other updates
Message-ID: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
Date: Fri, 30 Apr 2021 13:42:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set consists of random updates.

Patch 1/4 is a revised one to run periodcheck on "make"
or "make all", with the option to run only periodcheck
by "make periodcheck".  It also improves obsolete targets
"qq" and "mslm" by adding dependencies in the same way
done in "periodcheck-auto".

Patch 2/4 adds patterns to catch wrong uses of "\@." and
".\@".
I expect these two are confusing to anybody including myself.

Patch 3/4 is a trivial fix somewhat related to periods.
I think this type of errors can also be checked by a script.
Such a script is now on my todo list.

Patch 4/4 adds data of v5.12 in Figure 12.4.
I don't see any anomaly in v5.12, but I'm not closely
watching the changes in rcu/rcutorture of kernel tree.
If you are aware of any changes which necessitate updates
in CodeSamples/formal/rcutorture.sh, put this one on hold
and let me know what I can do.

        Thanks, Akira
--
Akira Yokosawa (4):
  Auto run periodcheck on 'make'
  periodcheck: Add check of '\@.' and '.\@' uses
  locking: Fix typo
  formal: Add v5.12 rcu-test data in Figure 12.4

 Makefile                  |   15 +-
 formal/RCU-test-ratio.eps | 1113 +++++++++++++++++++------------------
 formal/data/rcu-test.dat  |    3 +-
 locking/locking.tex       |    2 +-
 utilities/periodcheck.pl  |    4 +
 5 files changed, 585 insertions(+), 552 deletions(-)

-- 
2.17.1

