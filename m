Return-Path: <SRS0=bx9V=YP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7zZIUJnqEyVYyI+A2lpyLyIOFJiwMmyqpXIDJI9y9Dc=;
        b=IjbRCbOjMfmTw4ETDsaAO9MfaTD+svqNJ0/TRGA8QgqiuLfaUpLGGejta/lXcUbNiv
         zJWO6qa+q6qqTTTkWRpRPZhHQk72y+K2vfdqN5aLg2SVKZ8WLPmfGH72P6CX/7ZEn2zL
         KSu5yEx/E6c92NRyuwwrG72bH1/nLQl+Y4JyJYsy0aGowaZHYgQkkDxKBm5qMvJl+SoY
         C8XYjmmBh0+j881S8LsLIUiwCz0uEdXRXnSUfqKkRrODpNbb85ywUfdFtq9SbD4rRPyU
         JH3yGt/So5pTGrILWbkRDg5iRVYAJoArF/qktzmznok72QIej9diNWIL/LkbdGRG1L9j
         EaJA==
Subject: [PATCH v3 3/6] Add output of '% mainfile: perfbook.tex' tags in
 extraction scripts
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
 <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b4936bc5-ce6a-2d9d-25bc-8562e8bf2188@gmail.com>
Date: Tue, 22 Oct 2019 20:21:01 +0900
MIME-Version: 1.0
In-Reply-To: <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 448d26cb10c9e31408431762302e299d655f7521 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 20 Oct 2019 14:09:21 +0900
Subject: [PATCH v3 3/6] Add output of '% mainfile: perfbook.tex' tags in extraction scripts

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/extractcontrib.sh | 1 +
 utilities/extractorigpub.sh | 1 +
 utilities/extractqqz.sh     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/utilities/extractcontrib.sh b/utilities/extractcontrib.sh
index ae978ea0..8fc4b681 100644
--- a/utilities/extractcontrib.sh
+++ b/utilities/extractcontrib.sh
@@ -22,5 +22,6 @@
 #
 # Authors: Paul E. McKenney <paulmck@linux.ibm.com>
 
+echo "% mainfile: perfbook.tex"
 sed -n -e '/^\\ContributedBy{/p' |
 sed -e 's/^\\ContributedBy{/\\ContribItem{/'
diff --git a/utilities/extractorigpub.sh b/utilities/extractorigpub.sh
index 1fad230c..71154f96 100644
--- a/utilities/extractorigpub.sh
+++ b/utilities/extractorigpub.sh
@@ -22,6 +22,7 @@
 #
 # Authors: Paul E. McKenney <paulmck@linux.ibm.com>
 
+echo "% mainfile: perfbook.tex"
 sed -n -e '/^\\OriginallyPublished{/p' \
        -e '/^\\RangeOriginallyPublished{/p' |
 sed -e 's/^\\OriginallyPublished{/\\OrigPubItem{/' \
diff --git a/utilities/extractqqz.sh b/utilities/extractqqz.sh
index 921c78e8..5d54d31f 100644
--- a/utilities/extractqqz.sh
+++ b/utilities/extractqqz.sh
@@ -21,6 +21,7 @@
 #
 # Authors: Paul E. McKenney <paulmck@linux.ibm.com>
 
+echo "% mainfile: perfbook.tex"
 sed -n -e '/^\\QuickQuizChapter{/p' \
        -e '/^\\QuickQuiz{/,/^} \\QuickQuizEnd/p' |
 sed -e 's/^\\QuickQuizChapter{/\\QuickQAC{/' \
-- 
2.17.1


