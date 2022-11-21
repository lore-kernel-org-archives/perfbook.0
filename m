Return-Path: <SRS0=AAzi=3V=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5AprIDUTTZEaN2uiAC0j65uRJUgy5QS0NS7gFb5l4I=;
        b=K0ia6Ln2/ipGI0TNl8n3fIkq7OuZVDBTTDqxizL0D2si4S6Ruil4X5Uy2QtoUSgfZa
         rxZvCk4ZGkYHJE/+D0l0gyjRyteISGNp41IBwojNFvTHPrIz0oEhYObH845O7BLe7H43
         fRYSCuGj4/aHxXKktdMewCA16j2ddAtyAilAk0cEdBSAioLefxdPEm0jMjFceY1EIJyT
         ZqclvMgyHZ465UyZh7CgEI3KgYb7Mvn/GlDzQ2pYwax4HLtftCidIyD0eYWAzMiYa0PC
         C7OodBhv9SmkipC0JgyrKjqoT/5JYaTSvebgIy42Pzx+SWgm58rmZfXKyRNgMYlh9CCa
         kq4A==
Message-ID: <8428d210-edd6-a08f-6851-1eb6cc925416@gmail.com>
Date: Mon, 21 Nov 2022 23:49:36 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Replace "egrep" with "grep -E" in scripts
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In the NEWS section of grep 3.8 announce letter [1], there is a note
which reads:

  ** Changes in behavior
    ...

    The egrep and fgrep commands, which have been deprecated since
    release 2.5.3 (2007), now warn that they are obsolescent and should
    be replaced by grep -E and grep -F.

Replace "egrep" with "grep -E" in sh/bash scripts.

Note: There is no use of "fgrep" in perfbook tree.

Link: [1] https://lists.gnu.org/archive/html/info-gnu/2022-09/msg00001.html
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi,

This change is prompted by Tiezhu Yang's patch updating a script of
LKMM [2, 3].

[2] v1: https://lore.kernel.org/r/1668823998-28548-1-git-send-email-yangtiezhu@loongson.cn/
[3] v2: https://lore.kernel.org/r/1669001138-12302-1-git-send-email-yangtiezhu@loongson.cn/

        Thanks, Akira
--
 CodeSamples/SMPdesign/maze/reduce.bash | 16 ++++++++--------
 CodeSamples/defer/rcudelay.sh          |  2 +-
 CodeSamples/defer/rcuscale.sh          |  2 +-
 utilities/gitextractcontrib.sh         |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/CodeSamples/SMPdesign/maze/reduce.bash b/CodeSamples/SMPdesign/maze/reduce.bash
index 40dbe2351e81..91eb58ea19b5 100644
--- a/CodeSamples/SMPdesign/maze/reduce.bash
+++ b/CodeSamples/SMPdesign/maze/reduce.bash
@@ -31,9 +31,9 @@ scatter_file ()
 	local i
 	local j
 
-	for i in `ls | egrep '^[0-9]*$|^[0-9]*x[0-9]*$'`
+	for i in `ls | grep -E '^[0-9]*$|^[0-9]*x[0-9]*$'`
 	do
-		for j in `ls $i/pct_* | egrep '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
+		for j in `ls $i/pct_* | grep -E '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
 		do
 			ms=`echo $j | sed 's/\/pct_/\/ms_/'`
 			mstail=`echo $ms | sed 's/^[0-9]*\///'`
@@ -71,9 +71,9 @@ makecdf_file ()
 	local i
 	local j
 
-	for i in `ls | egrep '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
+	for i in `ls | grep -E '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
 	do
-		for j in `ls $i/ms_* $i/pct_* | egrep '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
+		for j in `ls $i/ms_* $i/pct_* | grep -E '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
 		do
 			makecdf $j
 		done
@@ -127,9 +127,9 @@ quantile_error_file ()
 	local i
 	local j
 
-	for i in `ls | egrep '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
+	for i in `ls | grep -E '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
 	do
-		for j in `ls $i/ms_* $i/pct_* | egrep '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
+		for j in `ls $i/ms_* $i/pct_* | grep -E '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
 		do
 			f=`echo $j | sed -e 's/^.*\///'`.quant
 			touch $f
@@ -158,9 +158,9 @@ average_file ()
 	local i
 	local j
 
-	for i in `ls | egrep '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
+	for i in `ls | grep -E '^[0-9]*$|^[0-9]*x[0-9]*$' | sort -k1n`
 	do
-		for j in `ls $i/ms_* $i/pct_* | egrep '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
+		for j in `ls $i/ms_* $i/pct_* | grep -E '^([0-9]*|[0-9]*x[0-9]*)/[a-zA-Z0-9_-]*$'`
 		do
 			f=`echo $j | sed -e 's/^.*\///'`.mean
 			touch $f
diff --git a/CodeSamples/defer/rcudelay.sh b/CodeSamples/defer/rcudelay.sh
index 5296eab6947b..80b7b3470dbe 100644
--- a/CodeSamples/defer/rcudelay.sh
+++ b/CodeSamples/defer/rcudelay.sh
@@ -98,7 +98,7 @@ do
 				fi
 			fi
 			echo Run for $prim with $ncpus CPUs and delay $curdelay$fstr
-			egrep '^Points: | reader duration:' $T
+			grep -E '^Points: | reader duration:' $T
 		done
 		curdelay=`echo $curdelay | sed -e 's/5/10/' -e t -e 's/2/5/' -e t -e 's/1/2/'`
 	done
diff --git a/CodeSamples/defer/rcuscale.sh b/CodeSamples/defer/rcuscale.sh
index 5c6588f464a1..295d760f3879 100644
--- a/CodeSamples/defer/rcuscale.sh
+++ b/CodeSamples/defer/rcuscale.sh
@@ -93,7 +93,7 @@ do
 			fi
 		fi
 		echo Run for $prim with $ncpus CPUs$fstr
-		egrep '^Points: | reader duration:' $T
+		grep -E '^Points: | reader duration:' $T
 	done
 	if ((ncpus >= 128))
 	then
diff --git a/utilities/gitextractcontrib.sh b/utilities/gitextractcontrib.sh
index 4291c9fe8663..d4069138e47a 100644
--- a/utilities/gitextractcontrib.sh
+++ b/utilities/gitextractcontrib.sh
@@ -23,7 +23,7 @@
 #
 # Authors: Paul E. McKenney <paulmck@kernel.org>
 
-git log $1 | egrep '^ *(Signed-off-by|Reported-by)' |
+git log $1 | grep -E '^ *(Signed-off-by|Reported-by)' |
 	sed -e 's/ *Signed-off-by: *//' -e 's/ *Reported-by: *//' |
 	sort -u | grep -v "Paul E. McKenney" |
 	sed -e 's/\([^<]*\)<\([^>]*\)>/\2 \1/' | sed -e 's/ *$//' |

base-commit: 64b2aa8513e974cfd9f53f744650617f1b9d66f4
-- 
2.25.1

