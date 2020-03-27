Return-Path: <SRS0=2js+=5M=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e79G8HcUBhQtJ0hzu1W3ysitePd+ILlnYEBuGcwXjxQ=;
        b=E0ZkTFZsBejMIEj8WyotSFTtoA0HVNStC/yRvLe+OMq3XuLIDeRfRN7Y9IFP43l0h5
         ZyA0F9QfR8eK8zp6ykVzqXGeB00uYFGvHWTc80HbFj4USqFslkQsFoAsvADpcQcn2vBa
         Byf553bnmJFg2SqiYW9QNlXDNDEWcPmc7hOEXqQuzcZfIe16bDTpHU5Iy3NZYI4ygvAE
         RZmeRqJ0Ds7zYxSla9e+l8ntEJcXHWn00t1QqZgqTbzrsk09XJzyaW905Ia9ZnVFlFyU
         xIfrYxVTOB4zQnuYQhmIs8ofFZpBf3B4Hi3SHecNms8GvlDjxf3t8AzrA9x24PE40qQ7
         smjg==
Subject: [PATCH 1/4] FAQ-BUILD: Add entry on recent breakage in texlive update
 on F31
References: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a7878d89-15da-330a-87b7-25b18350839b@gmail.com>
Date: Fri, 27 Mar 2020 20:21:41 +0900
MIME-Version: 1.0
In-Reply-To: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e34b39b60dcca460338cb310e38dbc13aa39c01a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 23 Mar 2020 12:20:20 +0900
Subject: [PATCH 1/4] FAQ-BUILD: Add entry on recent breakage in texlive update on F31

This workaround was suggested in [1].

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1796550#c11

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index b8ad20d8..6a1acff1 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -257,3 +257,16 @@
 
 		"make neatfreak; make" will rebuild all the figures.
 		The "-jN" option should accelerate the rebuild.
+
+13.	After updating texlive packages on Fedora 31, build fails with
+	the message from bibtex saying:
+
+		I found no \bibdata command---while reading file perfbook.aux
+		I found no \bibstyle command---while reading file perfbook.aux
+
+	Is there any workaround?
+
+	A.	Try rebuilding database files by the following commands:
+
+		    sudo updmap-sys --syncwithtrees --force
+		    sudo updmap-sys
-- 
2.17.1


