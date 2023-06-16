Return-Path: <SRS0=Dx3G=CE=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686897575; x=1689489575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Uh5zpgu/nMg5fGq2p9bh0tCiZyabRtS4BoD/oBZt50=;
        b=A9ViE13cCSr8w6ojgiH9HT7YvRiMAcrxXhi53jiGLR1pIsbvgN6R2X3bV84MxJuMwx
         T9wglnms6nNwpbv4ndtn9NigHVn98hol7tgcbFtAsf07GNI5ua8Gi4eXBzM6heZc5VIM
         Wdykp3PTv3Sl6UBZ7kZrrSKyumTMvyzAiSb5ZiFzzJzFgzC/Fq/dCfYDnktG2cZAnamP
         nGKvPRVIel61/Hq0T13VQVn+zOeSC+jsSytcWkWjlgsfpcY4C5B3T+rRhVbPQDhsG5f1
         2GhB3ktg6LZUJO8fc8CPnB4HhHVCS29l3H3M2Fs8OLMMaOIdLcWJ7lFPkLQEc1cLLUqm
         KvZQ==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH] CodeSamples/tree: Fix compiler warning on free
Date: Fri, 16 Jun 2023 03:39:03 -0300
Message-ID: <20230616063903.207676-3-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

While building the CodeSamples/datastruct/Issaquah/ directory, I can see
a couple instances of this warning:

In function ‘free_treenode_cache’,
    inlined from ‘tree_remove_all’ at tree.c:102:2,
    inlined from ‘tree_free’ at tree.c:128:2:
tree.c:251:9: warning: ‘free’ called on pointer ‘trp’ with nonzero offset 96 [-Wfree-nonheap-object]
  251 |         free(tnp);
      |         ^~~~~~~~~

I took a look and tried to understand what was happening:
- tree_remove_all() calls free_treenode_cache() on it's input, which ends
  up free()'ing it (!BAD_MALLOC)
- It makes sense in most treenodes, since they are allocated with
  alloc_treenode_cache() and the malloc() output is the same as the free()
  input.
- tree_free() calls tree_remove_all() on &trp->max, which ends up trying
  to free() this same address.
- trp is a struct treeroot, which is composed of 2 treenodes: min & max
- The output of malloc() for trp ends up being different from the address
  used for free(), since &trp->max is used instead, and there is an offset
  since max is the second element of struct treeroot.

To solve this while keeping the tree_remove_all() generic, move
struct traceroot->max to be the first element, and guarantee the address
used for free() is the same returned by malloc().

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 CodeSamples/datastruct/Issaquah/tree.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/datastruct/Issaquah/tree.h b/CodeSamples/datastruct/Issaquah/tree.h
index f007558a..bbe5e7c1 100644
--- a/CodeSamples/datastruct/Issaquah/tree.h
+++ b/CodeSamples/datastruct/Issaquah/tree.h
@@ -48,8 +48,8 @@ struct treenode {
  * Root of a tree.
  */
 struct treeroot {
-	struct treenode min;
 	struct treenode max;
+	struct treenode min;
 } __attribute__((__aligned__(CACHE_LINE_SIZE)));
 
 void treenode_wire_call_rcu(void);
-- 
2.41.0

