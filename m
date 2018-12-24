Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GQk8Khnx3/k/E5N3pqR9AxirZdjo+fDltreO348x4ow=;
        b=uKtN2fdrRCaCDxuI34yyxPxoGCVBRB0gUpz/EeJbyDLT4G7MBnrDna4fJWbKJRakCM
         5iXKg7VjBG4aForlNVRvK49obiHDgBXT9IxDfQcKcWkvDp6iuM6WI6h5Il8uFXkQCLfq
         3iEKXLJNnPbyxjbWyWvfFTI0AxpoVd8QYBzyQoSXAab9qXMgxONgLdp4jwIsOKJVqPQy
         gcaE98MbNYrFCEEdVvy1GKKEb3xNWHNCd5fLsY5WJZB+FhPEd3sR9Vp/ASGHsetZ06Ug
         LZiAdZAKN9BNr6KLr0w9k5D60AqSO+N5ZiiiQ668JM+Ho8sbYozyz9JYm1YKSt2ToQbL
         34mg==
Subject: [PATCH 03/11] fcvextract.pl: Make 'keepcomment=no' as default
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <24e7cc5a-1f67-24d1-52b6-1191417edbb9@gmail.com>
Date: Mon, 24 Dec 2018 23:56:39 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e9d75e866a39a9c9af9bf4c2da7c64225b302d42 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Dec 2018 13:43:57 +0900
Subject: [PATCH 03/11] fcvextract.pl: Make 'keepcomment=no' as default

This change removes comments in Listings 4.8 and 9.5, which were
inadvertently sneaked in during the scheme update.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/fcvextract.pl | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/utilities/fcvextract.pl b/utilities/fcvextract.pl
index 2ad201f..71e761d 100755
--- a/utilities/fcvextract.pl
+++ b/utilities/fcvextract.pl
@@ -90,8 +90,8 @@
 # on the line.
 #
 # By default, comment blocks of the form "/* ... */" in C language
-# code will be kept in the extracted snippet. To omit those blocks,
-# put an option "keepcomment=no" to \begin{snippet} meta command.
+# code will be removed in the extracted snippet. To keep those blocks,
+# put an option "keepcomment=yes" to \begin{snippet} meta command.
 #
 # Also, this script recognizes #ifndef -- #else -- #endif conditional
 # of the following form to allow alternative code for snippet:
@@ -130,7 +130,7 @@ my $file_name;
 my $func_name;
 my $label;
 my $env_name = "VerbatimL" ;
-my $keepcomment = 1;
+my $keepcomment = 0;
 my $incomment = 0;
 my $ifndef = 0;
 my $other_opts;
@@ -256,8 +256,8 @@ while($line = <>) {
 	    $esc_close = "\}" ;
 	}
 	if ($line =~ /keepcomment=([^,\]]+).\]/) {
-	    if ($1 eq "no") {
-		$keepcomment = 0;
+	    if ($1 eq "yes") {
+		$keepcomment = 1;
 	    }
 	    $_ = $line;
 	    s/keepcomment=[^,\]]+,?// ;
-- 
2.7.4


