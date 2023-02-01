Return-Path: <SRS0=uXRn=55=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV3rDb9CEEPYwEwSZWt6+amJp6QpzXGlQcj/qMg301Q=;
        b=mD+JVpFlwWyrR3KWA2b0cQ1P0Xbo64JfP/NhlW9yJVCwRrBXtM0EPU1XSK44vSXYy+
         6MkVV8SEVdiNpGNPR+LO09CT045H1YGe2PYiC3Hh92ZDUvWH6Rg71oixiMb3ufVq3BkC
         YzwiAGruUgfPr/P6l8ypfIvDKg35x8h/JRGeb/1ssi+6lQLUOYx4btxjYUgiSI47J29w
         bqzrzqnsnTHz5rGoj+J9w7q8cd9XdFXtMmXbkrPl5us2YVA5oZyNDxStKoHXa0VTHVTj
         PX4M4TC+sdxtjfJRZM874b2HUulhQCwF7cBqJoMESRKwJNXZyGHazqDZviCXVIbSmj3l
         t/UQ==
Message-ID: <efaac825-e1bd-92ec-525e-8fd84b8eeafc@gmail.com>
Date: Wed, 1 Feb 2023 09:23:10 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] FAQ-BUILD.txt: Add libertine in the list of fonts
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Font package "libertine" is necessary since commit 6be27f7414d8
("Use Biolinum font family for epigraph").

Add it to the list of font packages which are not included in
-fonts-recommended.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 107707533398..1ea9d92c90b0 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -149,6 +149,7 @@
 		in -fonts-recommended:
 
 			https://www.ctan.org/pkg/newtx
+			https://www.ctan.org/pkg/libertine
 			https://www.ctan.org/pkg/newtxtt
 			https://www.ctan.org/pkg/nimbus15
 			https://www.ctan.org/pkg/courier-scaled

base-commit: 32e14ef456725329455f35eda27c76b46b1f2763
-- 
2.25.1

