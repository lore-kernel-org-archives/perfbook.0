Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ruFSLGIFtvqo1ubvY6ihWJG7YhZuqZIwMuYWfjLs+Ko=;
 b=rPXFvacjOpqRs6+tXPB/vLct9/1+JF1ofWq+aZ4w/rU30fsg5oBasyWn9rzXCE6oVY
 CQ43lN85MJhV+Y0hcTx525kf/okbolV8W1m6+HkBZXoS4R80eb1kenQGi/2S0KKTlVZ+
 EDIu5C8jxztdkf3fO3bti3o0ezdybdKUhjEwM33PSEyH9ScLhzYeqzBgxTsWtwZAB8nO
 +x3kHT+xjLo/LCOmpcLrfIq+HHpMNs1Ek95Rn1Px1OT7ppnFhFU/Fejfc+xk78Cws2kQ
 F6O4xBd6y/o1Nh66KZo5VffANErRigFMjW7Tc1S+D+ew2Gxm6Of+qaK0QvdyqxC+lq1w
 8MLQ==
Subject: [PATCH 5/9] .gitignore: Add intermediate file suffix
References: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <75055502-4cbb-0447-0bfd-bf4dce4105f4@gmail.com>
Date: Sat, 12 May 2018 13:19:22 +0900
MIME-Version: 1.0
In-Reply-To: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d38e7159e5db13c36d78ccf4d1e21d1a83cecaf0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 00:49:24 +0900
Subject: [PATCH 5/9] .gitignore: Add intermediate file suffix

This change prevents autodate.sh from detecting intermediate files
as untracked files in parallel make.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index f0b8339..e8e42fb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -15,6 +15,8 @@
 *.tgz
 *.bz2
 *.swp
+*.epsi
+*.svgi
 perfbook_flat.tex
 qqz.tex
 contrib.tex
-- 
2.7.4


