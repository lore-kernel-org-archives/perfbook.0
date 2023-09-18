Return-Path: <SRS0=ra0i=FC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694998822; x=1695603622; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbBKKoBK6yy4AE/1B9FpM6ejonhz+ACetBBejY+zWts=;
        b=QMRT+DnMdtK7BWOh7iazIqw5zRFldkQ0bQ2jfZBFT0CyJQvogfH1WA0M9a4ixqzTep
         5jVDen0vSc25HMKPX5mgiLOCRVuUPwXMaKQhRjIuoDrfZr55/clShnnLVECVrpwm6oMI
         pjdXD0pBhZPR+Kqgpb7KLClHHJ/Rk9cMjYM49gjhYQS/GJ78w49aly9BGL+Trho+l8mp
         RhrnXfiMMuUNfmt6W62r86yXeFyHOPlTaxMkPX+sqqCiWubvt7hownUS9Ter0m3hm6Fw
         ZbMb2Aq+a8B42CcxTFEJAuOMEnO12GntZ29cctXBllErY01KMX36ur3nVRfS1NINNxFa
         QgWQ==
Message-ID: <3f951591-8279-eeda-65d4-42cb76a2a013@gmail.com>
Date: Mon, 18 Sep 2023 10:00:18 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfboof] memorder: Fix word choice (data dependencies -->
 address dependencies)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There remain obsolete word choices of "data dependencies" in section
Alpha.

It is load-to-load address dependencies that other archs respect.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I caught them while attempting to add index markers to
address/data/control dependency.

        Thanks, Akira
--
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 1a4edf8bbb6d..86bb8f41b5f8 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -5403,7 +5403,7 @@ One could place an \co{smp_rmb()} primitive
 between the pointer fetch and dereference in order to force Alpha
 to order the pointer fetch with the later dependent load.
 However, this imposes unneeded overhead on systems (such as \ARM,
-Itanium, PPC, and SPARC) that respect data dependencies on the read side.
+Itanium, PPC, and SPARC) that respect address dependencies on the read side.
 A \co{smp_read_barrier_depends()} primitive was therefore added to the
 Linux kernel to eliminate overhead on these systems, but was removed
 in v5.9 of the Linux kernel in favor of augmenting Alpha's definition
@@ -5428,7 +5428,7 @@ Upon receipt of such an IPI, a CPU would execute a memory-barrier
 instruction, implementing a system-wide memory barrier similar to that
 provided by the Linux kernel's \co{sys_membarrier()} system call.
 Additional logic is required to avoid deadlocks.
-Of course, CPUs that respect data dependencies would define such a barrier
+Of course, CPUs that respect address dependencies would define such a barrier
 to simply be \co{smp_store_release()}.
 However, this approach was deemed by the Linux community
 to impose excessive overhead~\cite{McKenney01f}, and to their point would

base-commit: 8224a12917dd115ead6fce0f785b19a4c7d50f18
-- 
2.25.1

