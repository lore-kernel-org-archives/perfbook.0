Return-Path: <SRS0=fbDN=CJ=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687324714; x=1689916714;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ubo4pSzIZ6bJDy1iCnIFNeWZ010EbLyINFy9YLwS16Y=;
        b=jjE1H5dCQ9rMpVsVxNXe6jL5HWwIJhKjRDu/vbVdx8Zc5qN57PMHj3L/Nqt1Gf05E+
         n4r/4TycAJOTipnYXKfzTUYlbEt3Q/dKhaccdjEfbjWPKV1MMoHTv2+pgnYDXMNJdaHG
         vlFCeL9p4yIV39GUSotdUaCj7IX0PL4KB5ziQsxVDyyMe0obxsIsoN+nejyHnP27oskR
         aGTBSlyZNeCMVa8muGn1IiIngX04xcuNrIfDKZXH2ynQs0vzV7KUU66cnD/CLM8WvhpP
         edu0cCkWzK5s7qwVXFGuG23UFM+hLRbHuT+NUOJWcViaosDsIcPdvVPFaNUo7sKrbkmX
         Wb7A==
Message-ID: <b87a066b68747d3f22257355459734b759159516.camel@gmail.com>
Subject: [PATCH v2] CodeSamples/tree: Fix compiler warning on free
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Wed, 21 Jun 2023 02:18:31 -0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E.McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

While building the CodeSamples/datastruct/Issaquah/ directory, I can see
a couple instances of this warning:

In function =E2=80=98free_treenode_cache=E2=80=99,
    inlined from =E2=80=98tree_remove_all=E2=80=99 at tree.c:102:2,
    inlined from =E2=80=98tree_free=E2=80=99 at tree.c:128:2:
tree.c:251:9: warning: =E2=80=98free=E2=80=99 called on pointer =E2=80=98tr=
p=E2=80=99 with nonzero offset 96 [-Wfree-nonheap-object]
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

To solve this while keeping the tree_remove_all() generic, add a boolean
free_node parameter to tree_remove_all() so the caller can decide if the
node should be freed. The new boolean is true for normal treenodes, and
false if the pointed treenode is contained in the struct treeroot.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 CodeSamples/datastruct/Issaquah/tree.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/CodeSamples/datastruct/Issaquah/tree.c b/CodeSamples/datastruc=
t/Issaquah/tree.c
index 052fa870..26600118 100644
--- a/CodeSamples/datastruct/Issaquah/tree.c
+++ b/CodeSamples/datastruct/Issaquah/tree.c
@@ -89,17 +89,19 @@ struct treeroot *tree_alloc(void)
  * readers accessing the tree.
  */
 static void tree_remove_all(struct treenode *cur,
-			    void (*freefunc)(void *p))
+			    void (*freefunc)(void *p),
+			    bool free_node)
 {
 	if (cur =3D=3D NULL)
 		return;
-	tree_remove_all(cur->lc, freefunc);
-	tree_remove_all(cur->rc, freefunc);
+	tree_remove_all(cur->lc, freefunc, true);
+	tree_remove_all(cur->rc, freefunc, true);
 	if (cur->perm)
 		return;
 	if (cur->data && freefunc)
 		freefunc(cur->data);
-	free_treenode_cache(cur);
+	if (free_node)
+		free_treenode_cache(cur);
 }
=20
 /*
@@ -125,7 +127,7 @@ static void tree_check_insertion(struct treeroot *trp, =
struct treenode *new)
  */
 void tree_free(struct treeroot *trp, void (*freefunc)(void *p))
 {
-	tree_remove_all(&trp->max, freefunc);
+	tree_remove_all(&trp->max, freefunc, false);
 	free(trp);
 }
=20
--=20
2.41.0

