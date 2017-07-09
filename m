Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025; h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ZXrIB55cnL7WUziQi16BZaFByQ7PfAsP3WZDx5X8Mr8=;
 b=Vp9D9KnlRm+tDugGv8FMXS7CIKQDzNiEGFZe07Xl2NFxP31rwECx6aayxxXw/Vb0AG
 b+Zb8p7/rr/EgoZtwVs3/hM0wHMRHcDutPW3O1iNzXZiS4Ess/oAw2sbkvDVwyBh+9Uo
 DyCRtVYZlgBFSOP/A2fqUNLI1JQu3ZEcKMeXeA9YtLdQIho3nJW4WSiiN45SVoPje7tS
 AQtI/DHAjtZ8hJOd5WV/AadAagxUi884X1SZAt9Lj0T4hN3Qm+QC68voT4Kr0MalAcA0
 GG4pcX2o8sZTiNVhhV0C7ngDHpYzVHavco4qr1mBkuvWl8FPXiHnb7RHkCrvIE+wM4Ov 01jg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] litmus test updates
Message-ID: <0f7d5b71-c960-6462-fc45-a83f757d88ee@gmail.com>
Date: Sun, 9 Jul 2017 10:39:46 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 955eefe8ad5a64fddd2e33b343ac3a1e171dd089 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Jul 2017 09:53:28 +0900
Subject: [PATCH 0/2] litmus test updates

Hi Paul,

I thought that embedding kernel API definitions in each litmus test is
redundant. We can use #include instead. In this case, we need to
specify a -I option for gcc as the compilation is done in a temporally
directory. We can do so by using -ccopts option of litmus7.

Patch 1 does this change.

However, in native run on x86_64, I'm seeing a significant difference
in the resulting statistics.
Before the change, a typical result is:

    Test C-SB+o-o+o-o Allowed
    Histogram (4 states)
    54    *>0:r2=0; 1:r2=0;
    49999628:>0:r2=2; 1:r2=0;
    49999697:>0:r2=0; 1:r2=2;
    621   :>0:r2=2; 1:r2=2;
    Ok

After the change, the result is something like:

    Test C-SB+o-o+o-o Allowed
    Histogram (4 states)
    26    *>0:r2=0; 1:r2=0;
    49999782:>0:r2=2; 1:r2=0;
    49999818:>0:r2=0; 1:r2=2;
    374   :>0:r2=2; 1:r2=2;
    Ok

In cross compilation mode, the result is similar and consistent
with the native run after the change.
So I suspect litmus7's behavior of native run is affected by the
"-ccopts" option. Again, this might depend on the platform variation.

Patch 2 adds targets for cross compilation mode of litmus7.
Because we need to copy the custom header file "api.h" into the target
directory, I made the recipe to do so.

I stopped short of adding recipes to make an archive and scp it to
remote host and to do remote compilation and execution via ssh.
They can be added later.

On PPC, the result of C-SB+o-o+o-o.litmus looks interesting.
(Of course, you are familiar with PPC, but...)

    Test C-SB+o-o+o-o Allowed
    Histogram (4 states)
    988335*>0:r2=0; 1:r2=0;
    49516879:>0:r2=2; 1:r2=0;
    49494779:>0:r2=0; 1:r2=2;
    7     :>0:r2=2; 1:r2=2;
    Ok
    
    Witnesses
    Positive: 988335, Negative: 99011665
    Condition exists (1:r2=0 /\ 0:r2=0) is validated
    Hash=9bb70a6ed845b4be5f335c7eeb134f3f

Note that I've not tested the result of "cross-arm" target actually
builds and runs on ARM hosts.

How does this approach look like?

        Thanks, Akira
-- 
Akira Yokosawa (2):
  advsync: Use '#include "api.h"' in litmus tests
  advsync: Add cross compilation targets

 CodeSamples/advsync/herd/.gitignore                |  5 ++++
 CodeSamples/advsync/herd/C-SB+o-mb-o+o-mb-o.litmus |  4 +--
 CodeSamples/advsync/herd/C-SB+o-o+o-o.litmus       |  3 +-
 CodeSamples/advsync/herd/Makefile                  | 34 ++++++++++++++++++++--
 CodeSamples/advsync/herd/api.h                     |  8 +++++
 5 files changed, 47 insertions(+), 7 deletions(-)
 create mode 100644 CodeSamples/advsync/herd/api.h

-- 
2.7.4

