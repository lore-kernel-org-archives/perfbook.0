Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=OcbQYpJzOpVOiX/00fFxhOZ0ck2wPn1XZyaKV71Dg+I=;
        b=YWwPQtZ8O8sDbu4Fbxl1F0RFlwQKs1TcLVkaYPDLR0U/R68U306GxVV474smwAFoVq
         nuAwOEqteTyMBGMwWWpjzFKM7rM4JYrRwk17KIbqpfywQeH0XD75hBgqxtveCdtijnrA
         lrz+ufmWjZmUVc6Y7vf+Jc/bkqFnR5xtwMtdyFqVeMdogWRta/aSgiqP1+w5uNvxrsLS
         R6nFhnMCSrlJ4XgCRRU39F9oN5reN+eoC3QBEJ1z1syZjg7YmlxWjxBhTVdCxDZvoUM0
         Gqps3QPMbCk6ZDTYyg6Lm5SlHye2zD/v7CSYjQ/U3MdyixhFJ3kG9r3qO5LO41IFJGFL
         4ejQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] Simplify hash_resize.c
Message-ID: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
Date: Mon, 14 Jan 2019 08:28:27 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7b69a9b37ba9a73a50aad5cbb097235ddfe75870 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 14 Jan 2019 07:25:14 +0900
Subject: [PATCH 0/6] Simplify hash_resize.c

Hi Paul,

This patch set updates hash_resize.c, which you suggested for me to
take over, and the related text.

I added a couple of Quick Quizzes as well, and in one of them,
I included your version of hash_resize.c.

Patch #1 updates hash_resize.c in the way I suggested. Note that
in this update, "#ifndef FCV_SNIPPET" blocks are used to hide
code for debugging (hash value checks) in code snippets.
This code can actually be compiled with "-DFCV_SNIPPET" to see
the performance without hash value checks.

Patch #2 adds a couple of Quick Quizzes. Your version of hash_resize.c
is added as hash_resize_s.c.

Patch #3 removes unnecessary folding in a code snippet.

Patch #4 adjusts a few sentence to the simpler approach.

Patch #5 adds another Quick Quiz.

Patch #6 adds an "#error" directive for the lack of rcu_barrier().

All of the updates in text would need your native eyes to be polished.

        Thanks, Akira

PS:

I couldn't make out your concern of "if we ever want to iterate over
the hash table". Can you elaborate it?

--
Akira Yokosawa (6):
  datastruct/hash: Simplify hash_resize.c
  datastruct/hash: Add a couple of Quick Quizzes regarding hash_resize.c
  datastruct/hash: Fix unnecessary folding in code snippet
  datastruct/hash: Adjust context to updated code in hash_resize.c
  datastruct/hash: Add Quick Quiz on READ_ONCE/WRITE_ONCE in
    hash_resize.c
  datastruct/hash: Display error msg if rcu_barrier() is not available

 CodeSamples/datastruct/hash/Makefile        |   5 +-
 CodeSamples/datastruct/hash/hash_resize.c   |  62 +++--
 CodeSamples/datastruct/hash/hash_resize_s.c | 365 ++++++++++++++++++++++++++++
 CodeSamples/datastruct/hash/hashtorture.h   |  11 +-
 datastruct/datastruct.tex                   | 146 +++++++----
 5 files changed, 513 insertions(+), 76 deletions(-)
 create mode 100644 CodeSamples/datastruct/hash/hash_resize_s.c

-- 
2.7.4

