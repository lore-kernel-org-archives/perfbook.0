Return-Path: <SRS0=eHyo=3O=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgFGp5Fly6ktodikEsUys+zFAWbCGALEAZrpxM4MdbM=;
        b=mmm2pgL02fkKozAk7fla5J7wT95bbhKtdzGqYohRilsNLCsimVtY3TFF/1TbX4hzZp
         XJP4uYpoXeIIKvXLB/P4tp1naX+l4eWTYPaOBXD0IQTOl5NeJ9deERRHBxC3+0bmniQS
         3xS/jxOVyqEw7YGT7hXbjC/CFWeOGL6bbcJxMU5sX2nLXj0ux6Q9uiN9ONO1NI8ioZtf
         SEx1wrHgjKMuTpxI8w4WDJXKO0RKlXh9fxaqVbx2eIq2noceXfBrESA4FRmRaK5pKDwX
         R6AR/0e9nuPyq3nTg9rQclz43J7GNXBMM9eozXqh86BaVPCnNMRMHsbATK6H5AvtrxCH
         Ayuw==
Message-ID: <b636c9f8-31ad-599e-d75b-d23d2e1fdb4b@gmail.com>
Date: Tue, 15 Nov 2022 06:43:59 +0900
MIME-Version: 1.0
Subject: [PATCH v2 -perfbook] CodeSamples: Add -fcommon to GCC_ARGS
References: <a72f12a9-0b7a-b711-62c4-11bd76cfde65@qa2.so-net.ne.jp>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <a72f12a9-0b7a-b711-62c4-11bd76cfde65@qa2.so-net.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

An item on GCC 10 changes [1] reads:

  - GCC now defaults to -fno-common. As a result, global variable
    accesses are more efficient on various targets. In C, global
    variables with multiple tentative definitions now result in
    linker errors. With -fcommon such definitions are silently
    merged during linking.

This change affects builds under CodeSamples/ as reported by Elad [2].

As a band-aide fix, add -fcommon to GCC_ARGS where necessary.

Reported-by: Elad Lahav <e2lahav@gmail.com>
Link: [1] https://gcc.gnu.org/gcc-10/changes.html
Link: [2] https://www.spinics.net/lists/perfbook/msg03690.html
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v2:
 - Fix mismatch of From: and S-o-b.

        Thanks, Akira

--
 CodeSamples/datastruct/Issaquah/Makefile | 2 ++
 CodeSamples/datastruct/hash/Makefile     | 2 ++
 CodeSamples/defer/Makefile               | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
index 51b91fd8dafa..c3b724d750b2 100644
--- a/CodeSamples/datastruct/Issaquah/Makefile
+++ b/CodeSamples/datastruct/Issaquah/Makefile
@@ -32,6 +32,8 @@ endif
 
 include $(top)/recipes.mk
 
+GCC_ARGS += -fcommon
+
 # NOTE:  For decent scalability on update-side tests as of early 2015,
 #	 use something like jemalloc() instead of glibc malloc().
 #	 If you install jemalloc at /home/paulmck/jemalloc, you will
diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
index 80568cd11981..a56255a272eb 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -32,6 +32,8 @@ endif
 
 include $(top)/recipes.mk
 
+GCC_ARGS += -fcommon
+
 hash_bkt: hash_bkt.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c $(LIB)/random.c -lpthread
 
diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index 46cb87a1c9dc..3cf3e5a5f134 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -61,6 +61,8 @@ endif
 
 include $(top)/recipes.mk
 
+GCC_ARGS += -fcommon
+
 # Note that bug_srcu_a is disabled until completed.
 bug_srcu_a: bug_srcu_a.c srcu.c ../api.h
 	cc $(GCC_ARGS) -o bug_srcu_a -DTEST bug_srcu_a.c -lurcu -lpthread

base-commit: 7f7a2c25e3d2e87412d10bdb355b369eca524b1a
-- 
2.25.1


