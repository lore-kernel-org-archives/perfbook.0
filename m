Return-Path: <SRS0=FK0K=U4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=MGcHbR36s3iyIQaVIbH2Eby0aP/aqkkvgkcQGgBjyco=;
        b=JeFS0UarUp7KsSEpDcpu1Cc6ub1xT1JhbHgaQZGvv3lXcgqWb9vPBjVwXCSpGUKs/b
         j2JKLmoKSYXp+r19UThictHqDpYAsuG8WOucZNV3VyRHzz8ttT4p6qlQdX65MMUpgmns
         k5zO9a4QNBFMLRGzssx7dtf0VJWoH+caCuSg9dioqgiRhoYvjt3PV2y21mBXWts0hm9O
         IcyYlR91EDYQXQj1v27ubtjNtFp9rqxEdR5iXj21ZjaILON5PUH70WTtz9ebIpXxyg8y
         vscxKsTST5E4EDmo9TxzxIZQGdOeyj+Uz/fq0VSuY0GrtIkcnHHRnPRJWYZiD77WrygW
         hbyQ==
Message-ID: <551bdf14-33c0-6876-6644-ff3494ad38f0@gmail.com>
Date: Mon, 18 Apr 2022 18:54:21 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/3] glossary: Tweak index markers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

\IXGr{} is for marking a term with uppercase chars preserved
(e.g., proper nouns, Company names, etc.).
Use \IXG{} instead for normal terms.

Use \IXGh{}{} for "read memory barrier" and "write memory barrier"
so that they come together under "memory barrier" in the 
hierarchical index.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glossary.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/glossary.tex b/glossary.tex
index ffe46efd..d488670d 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -9,7 +9,7 @@
 	        David~Levary~et~al.}}
 
 \begin{description}
-\item[\IXGr{Acquire Load}:]
+\item[\IXG{Acquire Load}:]
 	A read from memory that has acquire semantics.
 	Normal use cases pair an acquire load with a release store,
 	in which case if the load returns the value stored, then all
@@ -396,7 +396,7 @@
 	caches, and store buffers in which values might be stored.
 	However, this term is often used to denote the main memory
 	itself, excluding caches and store buffers.
-\item[\IXGr{Memory Barrier}:]
+\item[\IXG{Memory Barrier}:]
 	A compiler directive that might also include a special
 	memory-barrier instruction.
 	The purpose of a memory barrier is to order memory-reference
@@ -576,7 +576,7 @@
 	RCU is thus best-suited for read-mostly situations where
 	stale data can either be tolerated (as in routing tables)
 	or avoided (as in the Linux kernel's System V IPC implementation).
-\item[\IXGr{Read Memory Barrier}:]
+\item[\IXGh{Read}{Memory Barrier}:]
 	A memory barrier that is only guaranteed to affect the ordering
 	of load instructions, that is, reads from memory.
 	(See also ``memory barrier'' and ``write memory barrier''.)
@@ -620,7 +620,7 @@
 	entity.
 	Reference counters provide existence guarantees and are sometimes
 	used to implement garbage collectors.
-\item[\IXGr{Release store}:]
+\item[\IXG{Release store}:]
 	A write to memory that has release semantics.
 	Normal use cases pair an acquire load with a release store,
 	in which case if the load returns the value stored, then all
@@ -743,7 +743,7 @@
 \item[\IXG{Wait Free}:]
 	A forward-progress guarantee in which every thread makes
 	progress within a finite period of time.
-\item[\IXGr{Write Memory Barrier}:]
+\item[\IXGh{Write}{Memory Barrier}:]
 	A memory barrier that is only guaranteed to affect the ordering
 	of store instructions, that is, writes to memory.
 	(See also ``memory barrier'' and ``read memory barrier''.)

base-commit: cccd47c1bcda6420bfe3acdb690aa7eb86c8a769
-- 
2.25.1

