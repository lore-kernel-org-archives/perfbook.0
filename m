Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Ia7IlOU9bTcXuBeRjqpdeo9X8rbDWbLf/CVZ9F7n9wc=;
 b=SU+ODhzP0t8lzg3FMiaQuA0N868HHH5bfyL8GCOWIPaC6AeP3JEEK/UJIkNeECURDj
 25XzpylSOFUTpukI/FYPqs5I5ZcsBZgW/INuOMAidwSysUifH8T5GK43WBFWw4rJvmQW
 PCzqcLfD1CfnQYmo5ToSiADM7sgA5nltVPIzM9Ysdy2ijX9BoDwSkFzFeLYhQY/T8QWU
 xUcoXQJ21oQ6FPN8L7w0QYjCMNvvpm3cgMKWPMaJs1akXefAMmjV3pXU+dPuMo2rU454
 /w7ufVjh5Q3Bme3yGERSHhmD9pRaCNnRLhPX/tszQpKTssj5tOPqJ77ypw0llFhMqrn1
 ZqgA==
Subject: [PATCH 7/7] bib/syncrefs: Replace broken url of radovic03hierarchical
 with doi
References: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8dcbe9aa-1faf-1d2e-6e8f-d12b2af359bb@gmail.com>
Date: Fri, 3 Feb 2017 23:11:17 +0900
MIME-Version: 1.0
In-Reply-To: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d6a74ae528d3d8134d4d21f385c34745d5a31a7b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 14 Nov 2016 10:59:51 +0900
Subject: [PATCH 7/7] bib/syncrefs: Replace broken url of radovic03hierarchical with doi

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 81bb9e4..898459d 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1237,8 +1237,8 @@ High Performance Computer Architecture ({HPCA-9})"
 ,year=2003
 ,address="Anaheim, California, USA"
 ,month="February"
-,url={citeseer.nj.nec.com/radovic03hierarchical.html}
 ,pages="241-252"
+,doi="10.1109/HPCA.2003.1183542"
 }

 @techreport{LukeBrowning2005SimpleLockNUMAAware
-- 
2.7.4


