Return-Path: <SRS0=cZgG=47=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=x/lvytzYI480lSzSVXHDo0jsmtQo9sUpzcnZORSoYwQ=;
        b=MFfDdBI2S/uLmHqKxMhPh74BLTc0h78yhiG0k7tzgmLTUePvNj2A1YnhOEvM9LGBjx
         KWb454c/GqwC6CGa8Lcv4K38oNQwGfPMf6KqPSX4m3VcFxcBhQb83QK321kgD/Jc44Rx
         Ax/G5/CloIphtwpBTYnaYol0PEcBD96PhaA4Z7PBRC3fQ2dtWwRWcPurNJvLKeK1lEwJ
         jXMnunIqXm8qYOFgLChxhK1+ppPWJRUMVBkZq+GZwJQqZWyyFuFYvtkZ+i0YxTDjCbI4
         tnkpcj3CfiOsDw5SYhKgdxRC3VRwh63Bh88ag9oNFjWJV3G/TGhcJnfnOee5+V0ULnQj
         8gTA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] hw.bib: Disable hyperlink of obsolete URL
Message-ID: <01b5fc9a-eac8-f936-4d75-0a402d9bd847@gmail.com>
Date: Sun, 15 Mar 2020 00:25:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a5022b7057bcf10bc0856886e7a4b5942608cd61 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Mar 2020 00:22:49 +0900
Subject: [PATCH] hw.bib: Disable hyperlink of obsolete URL

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 4f6dcbee..9b697a3b 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -170,7 +170,7 @@ System Programming",
  Title="{OpenCL\textsuperscript\texttrademark} Zone---Accelerate Your Applications",
  year="2017",
  month="January",
- note="\url{http://developer.amd.com/tools-and-sdks/opencl-zone/} (Obsolete, see bibentry AMD2020ROCm)",
+ note="\nolinkurl{http://developer.amd.com/tools-and-sdks/opencl-zone/} (Obsolete, see bibentry AMD2020ROCm)",
 }
 
 @unpublished{AMD2020ROCm,
-- 
2.17.1

