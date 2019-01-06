Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=QmWGY9wrGlqwbTMmC0Jk1tTWRBde7zC40uYu82HXZTo=;
        b=LTXyeQ5dhOLlSau/FuaCrsuBhNr7MSBg5l0h/2vEkTi4XkZ6B5ENLuc+lveFg558hE
         dUM1ovhsULLy8BLgAuRA2YGjRbURin0KqLsQpyQuVYajomtXgoJK+FvGCVQy2NTuePRD
         uOEU5v2nFjrnQoPHUA/uMWa+h5NYpynTsnIHTcWVCz3tE5ucHaQucF6xb5ySxOOwjfhO
         1NObiwT/Ca45K+MnaNhUTW5EDzSoVDmvlMrM5pzvx1K4qUxUcuMDbequ3CbRy+oM/KZ7
         7GxMDKx46XhSTkfaQWvpwcJ3++omV+apjwHpkmWFML+wRNCzrdHWLPP76zeE/fkNnfLs
         jTzQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] datastruct/hash: Fix trivial typo
Message-ID: <e06562fd-e309-7cf8-a19f-370fc758cbed@gmail.com>
Date: Sun, 6 Jan 2019 16:47:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e098b7a00c75e0a1605e7986c0b48e8a9a56dc8c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 6 Jan 2019 15:39:47 +0900
Subject: [PATCH] datastruct/hash: Fix trivial typo

List of fixes:

    o Non-breakable spaces for single letter parameters such as
      "parameter b" and "parameter h"

    o Trivial typo ("ths" -> "the")

    o Remnant of the old way of presenting code snippets
      ("figure" -> "listing")

    o Missing \ref{} command

    o Redundant words: ("be be"), ("the each")

    o Missing "are" in passive voice

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I've read through the updated Section 10.4.2.
It becomes much easier to follow, partly because I have a better
understanding of the code now. Quick Quizzes 10.12 and 10.13 make
a lot of sense.

This patch fixes what I noticed while reading.
It might not necessarily reflect your intention, though.
For example, "ths" can be "this" rather than "the".
Feel free to make any adjustment.

        Thanks, Akira
--
 datastruct/datastruct.tex | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index f9685d8..5c61bf5 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -973,23 +973,23 @@ The \co{ht_get_bucket_single()} function returns a reference to the bucket
 corresponding to the specified key in the specified hash table, without
 making any allowances for resizing.
 It also stores the bucket index corresponding to the key into the location
-referenced by parameter \co{b} on
+referenced by parameter~\co{b} on
 line~\lnref{single:gethash}, and the corresponding
 hash value corresponding to the key into the location
-referenced by parameter \co{h} (if non-\co{NULL}) on line~\lnref{single:h}.
+referenced by parameter~\co{h} (if non-\co{NULL}) on line~\lnref{single:h}.
 Line~\lnref{single:return} then returns a reference to the corresponding bucket.
 
 The \co{ht_get_bucket()} function handles hash-table selection, invoking
 \co{ht_get_bucket_single()} on
 line~\lnref{call_single} to select the bucket
 corresponding to the hash in the current
-hash table, storing the hash value through parameter \co{b}.
+hash table, storing the hash value through parameter~\co{b}.
 If line~\lnref{resized} determines that the table is being resized and that
 line~\lnref{call_single}'s bucket has already been distributed across the new hash
 table, then line~\lnref{newtable} selects the new hash table and
 line~\lnref{newbucket}
 selects the bucket corresponding to the hash in the new hash table,
-again storing the hash value through parameter \co{b}.
+again storing the hash value through parameter~\co{b}.
 \end{lineref}
 
 \QuickQuiz{}
@@ -1005,7 +1005,7 @@ again storing the hash value through parameter \co{b}.
 } \QuickQuizEnd
 
 \begin{lineref}[ln:datastruct:hash_resize:get_bucket]
-If line~\lnref{chk_i} finds that parameter \co{i} is non-\co{NULL}, then
+If line~\lnref{chk_i} finds that parameter~\co{i} is non-\co{NULL}, then
 line~\lnref{set_idx} stores the pointer-set index for the selected hash table.
 Finally, line~\lnref{return} returns a reference to the selected hash bucket.
 \end{lineref}
@@ -1053,7 +1053,7 @@ resizing operation from distributing that bucket, though of course it
 will have no effect if that bucket has already been distributed.
 Lines~\lnref{lsp0b}-\lnref{lsp0e} store the bucket pointer,
 pointer-set index, and hash value into their respective fields in the
-\co{ht_lock_state} structure, which communicates ths information to
+\co{ht_lock_state} structure, which communicates the information to
 \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
 Line~\lnref{ifresized} then checks to see if a concurrent resize
 operation has already distributed this bucket across the new hash table,
@@ -1068,7 +1068,7 @@ line~\lnref{get_newbkt} selects the bucket corresponding to the key,
 and line~\lnref{acq_newbkt} acquires the bucket's lock.
 Lines~\lnref{lsp1b}-\lnref{lsp1e} store the bucket pointer,
 pointer-set index, and hash value into their respective fields in the
-\co{ht_lock_state} structure, which communicates ths information to
+\co{ht_lock_state} structure, which communicates the information to
 \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
 Note that in this case, two locks are held, one in the old \co{ht_bucket}
 structure to prevent resizing that bucket (if not already resized),
@@ -1105,7 +1105,7 @@ section.
 	Furthermore, the insertion operation takes place within an
 	RCU read-side critical section.
 	As we will see when we examine the \co{hashtab_resize()}
-	function, this means that the each resize operation uses
+	function, this means that each resize operation uses
 	\co{synchronize_rcu()} invocations to wait for the insertion's
 	read-side critical section to complete.
 } \QuickQuizEnd
@@ -1119,12 +1119,12 @@ section.
 Now that we have bucket selection and concurrency control in place,
 we are ready to search and update our resizable hash table.
 The \co{hashtab_lookup()}, \co{hashtab_add()}, and \co{hashtab_del()}
-functions shown in
+functions are shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}.
 
 \begin{lineref}[ln:datastruct:hash_resize:access:lkp]
 The \co{hashtab_lookup()} function on
-lines~\lnref{b}-\lnref{e} of the figure does
+lines~\lnref{b}-\lnref{e} of the listing does
 hash lookups.
 Line~\lnref{get_curtbl} fetches the current hash table and
 line~\lnref{get_curbkt} obtains a reference
@@ -1163,7 +1163,7 @@ failure.
 } \QuickQuizEnd
 
 \begin{lineref}[ln:datastruct:hash_resize:access:add]
-The \co{hashtab_add()} function on lines~\lnref{b}-\lnref{e} of the figure adds
+The \co{hashtab_add()} function on lines~\lnref{b}-\lnref{e} of the listing adds
 new data elements to the hash table.
 Line~\lnref{new} determines whether a resize was in progress and the
 corresponding old bucket has already been distributed (value of one)
@@ -1181,7 +1181,7 @@ The caller is required to handle concurrency, for example, by invoking
 
 \begin{lineref}[ln:datastruct:hash_resize:access:del]
 The \co{hashtab_del()} function on
-lines~\lnref{b}-\lnref{e} of the figure removes
+lines~\lnref{b}-\lnref{e} of the listing removes
 an existing element from the hash table.
 Line~\lnref{i} picks up the index of the pointer pair
 and line~\lnref{del} removes the specified element.
@@ -1278,7 +1278,7 @@ and line~\lnref{acq_oldcur} acquires that bucket's spinlock.
 	\co{hashtab_del()} functions must nevertheless be enclosed
 	in RCU read-side critical sections, courtesy of
 	\co{hashtab_lock_mod()} and \co{hashtab_unlock_mod()} in
-	Listing{lst:datastruct:Resizable Hash-Table Update-Side Concurrency
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency
 	Control}.
 	\end{lineref}
 } \QuickQuizEnd
@@ -1382,7 +1382,7 @@ somewhat due to the cache misses causes by the updates to each element's
 pointers, and this effect is most pronounced when the hash-tables
 bucket lists are short.
 This indicates that hash tables should be resized by substantial amounts,
-and that hysteresis should be be applied to prevent performance degradation
+and that hysteresis should be applied to prevent performance degradation
 due to too-frequent resize operations.
 In memory-rich environments, hash-table sizes should furthermore
 be increased much more aggressively than they are decreased.
-- 
2.7.4

