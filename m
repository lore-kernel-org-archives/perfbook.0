Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ERj72eP9y3O379O69XeDhr7Xu68qrrUyD6EMfZRAPKI=;
 b=IljRB/NWH62ENexl3A0mkL77TZGCo1t5h6HHbDDUDpSA31nRgRnCEBBBalnHm1ZkDZ
 7euA3CSSLcC69mcmUP8zB0MvZh3hdcaNlM/my2I9NXsPV9CqyyvHsamifukVXO3nU/pJ
 USZQn5q81fEXPEEkYHONE6qJgBIHx/O+Bb3VxB/UiYE7vK0u3DzkUrLrg3UmvgFMEc/W
 8kIOU/hak5VFLLK/KR0Y7ljdhNe1vIWadKJA7DozlvZ7c14hm/Z7eh8kNW82PgQNlwka
 toAJUomt/lxEvbF6Y15rUMNYaZCrLsnJVdl8lEa7zM6vqNvfaSqV3m/UNXNgfXXIly6K
 LzYA==
Subject: [PATCH 4/5] bib/parallelsys: Properly format UCB in author field
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3d96849e-77bd-114d-e16c-4bb22045aab1@gmail.com>
Date: Wed, 8 Feb 2017 23:59:29 +0900
MIME-Version: 1.0
In-Reply-To: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9f05d622dc3de45e4aba9c7f3d9ef99de5ff1177 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 3 Feb 2017 00:23:49 +0900
Subject: [PATCH 4/5] bib/parallelsys: Properly format UCB in author field

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/parallelsys.bib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bib/parallelsys.bib b/bib/parallelsys.bib
index 1f1b1f2..2091bcd 100644
--- a/bib/parallelsys.bib
+++ b/bib/parallelsys.bib
@@ -285,7 +285,7 @@ and Victor Basili"
 }

 @unpublished{BOINC2008
-,author={University of California, Berkeley}
+,author={{University of California, Berkeley}}
 ,title="{BOINC}: compute for science"
 ,Year="2008"
 ,Month="October"
@@ -307,7 +307,7 @@ and Victor Basili"
 }

 @unpublished{SETIatHOME2008
-,author="University at California Berkeley"
+,author="{University of California, Berkeley}"
 ,title="{SETI}@{HOME}"
 ,Year="2008"
 ,Month="December"
-- 
2.7.4


