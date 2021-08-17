Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sUiuyr4cOBlzgITSCMg2s9YDT5i0WxykV7no4VRV208=;
        b=qW2+4URw/dOX8rhxUt8zCqaQOkG1GFbzoC8EPDG9nutN3jlNBQv/BDN8gqLsEsnXns
         DRsYr2dNAGczyvqF9DaR3htdRBSQ4ntEbu3HBwUcjvGAfMk149Xpu74dGPFJvXAYfaL6
         g5Eeh8l0KRyOa5b5aIc1VO4/bkeKpDK36mjpeNeK8hvNVepEurCCDNyGEMVNGOpOog5W
         yuDvcUL6IpYRUdj+a+aM2/qDnAAH+DluldQTQSb2vxVuwkwPn95vELMxAzNDeDinJhca
         7ZKGAC4HZwQS/LelM3iQDNCP6oorwlw/Qi5Owm29LvHAH/GhQSzTxmGHkDHMxS3cY65Z
         H3/g==
Subject: [PATCH -perfbook 10/11] cleverefcheck: Add pattern to catch typo in
 indexing macros
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <faf4dbad-9b80-391e-7385-847d0edb1a16@gmail.com>
Date: Tue, 17 Aug 2021 19:39:05 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There were cases where custom macros for indexing such as \IX, \Acr,
\IXacr, etc. lacked the "\" leading them.
Add patterns to catch such typo.
They rely on the leading parts of those macros are spelled right.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/cleverefcheck.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
index 69497893..0085fdb5 100755
--- a/utilities/cleverefcheck.pl
+++ b/utilities/cleverefcheck.pl
@@ -21,6 +21,10 @@ my $ng = 0;
 my $Verbatim_begin = qr/\\begin\{(Verbatim|tabula|equation|SaveVerb|verbbox)/ ;
 my $Verbatim_end = qr/\\end\{(Verbatim|tabula|equation|SaveVerb|verbbox)/ ;
 my $label_ptn = qr/(^\s*|\{)(,?[a-z]{3,4}:([a-zMPS]+:)?[^\},]+)(\}|,)/ ;
+my $IX_ptn = qr/(^|\s+)IX[^\s\{]*{/ ;
+my $api_ptn = qr/(^|\s+)api[^\s\{]*{/ ;
+my $ppl_ptn = qr/(^|\s+)ppl[^\s\{]*{/ ;
+my $acr_ptn = qr/(^|\s+)[aA]cr[^\s\{]*{/ ;
 my $in_footnote = 0 ;
 my $footnote_save = 0;
 
@@ -90,6 +94,10 @@ sub check_line {
 	    $line =~ /^(?=[\s]*+[^%])[^%][ ]+\t/) { # TAB after white space
 	    $ng += 1;
 	}
+	if ($line =~ /$IX_ptn/ || $line =~ /$api_ptn/ ||
+	    $line =~ /$ppl_ptn/ || $line =~ /$acr_ptn/ ) {
+	    $ng += 1;
+	}
 	if ($ng) {
 	    print $ARGV[0], ':', $line_num, ':', $raw_line;
 	}
-- 
2.17.1


