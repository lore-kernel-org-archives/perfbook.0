Return-Path: <SRS0=a7bX=FF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=VWnbi3+3uPm1YvfP7xT/bRLb8JpgJ8yjoE/1zexIys8=;
        b=kxT6uQWqLqYUwo3+9ToFIaZ4KZ/AbFJ6p97/gaOh4tXZqfOFH+3bI1cAS8hiUjF+6N
         P3aMAhZTOzCrnjTIkf91+JzP+xZCjIgi7j2rfz56MIiwz8YNyme8RacuvsIsJDEDn2DJ
         YtHp3Uh18WVe8B6Jm8z7KXIDFhNX9rOnmltMgAnRQhuMdWoc4MjAZ8nY4hwTp8wBdmhS
         A5ZO2A/dMWXuXMk3V8HNtMlVBLAxKERPKjI9lr7SG9DyFFmi5dcO2tCxu3Bks0XBv73k
         qJghBXgleojx2ZsrAY01Get06jdROhgVlOhUGJFa3nZYPqTn4cN1hXCLKv7PVNUnQVMO
         THFw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] hw.bib: Mark broken link of Alpha wizard's archive as such
Message-ID: <c930978c-e022-0961-4bc1-85d7f06497fb@gmail.com>
Date: Wed, 2 Dec 2020 07:29:20 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 030e802355d7de125f9c32363d768380a35ac2bd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 2 Dec 2020 07:25:49 +0900
Subject: [PATCH] hw.bib: Mark broken link of Alpha wizard's archive as such

The Alpha wizard's archive under the hp.com domain no longer works.

This change is inspired by a recent commit in the -rcu tree from
Paul Gortmaker.

Indirectly-reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 9b697a3b..b63b0622 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -290,8 +290,9 @@ System Programming",
  Title="Shared Memory, Threads, Interprocess Communication",
  month="August",
  year="2001",
- note="Available:
-\url{http://h71000.www7.hp.com/wizard/wiz_2637.html}",
+ note="URL:
+\nolinkurl{http://h71000.www7.hp.com/wizard/wiz_2637.html}
+[broken, November 2020]",
 }
 
 @unpublished{MichaelCree2010AlphaLinux,
-- 
2.17.1

