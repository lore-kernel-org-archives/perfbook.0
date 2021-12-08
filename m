Return-Path: <SRS0=4u0W=QZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mtjsi6J8SG/dyacVFnlaa3SPtV5afxXOkiFQKRcoLDc=;
        b=Zx15eRB+CjpeTg9498xiuIUWuXcVckOGvlEQWDGHhjQJ6ZZm9EPm0M4KYkicnR12zK
         PblYrKy3GkMmQKw8i2u4QwumU2Dvb86aeAjfORuIl6x0qVzAgA2sgTXriavdDBAlXpmz
         wYZ0Uk0ENr/Uu+61v3PiNLmw+GGJOI4hbIUDU/VxeuqF52J50S40Otos7X1T+EUDUh9p
         H8tKhRHTT9kmiZAjwV+x4PWJADFZKhTSZ4cK5iz/bTKfx43welXH6Z0NiIaWtALiVjLp
         lqCWF7gVLVg26mxH8fGd+oSa3P6VvEOuBkK0o5PKfRrlmBs0aBslHhXBFmkIx26KWU+E
         acww==
Subject: [PATCH -perfbook 1/4] cleverefcheck.pl: Add test of listing next to
 heading
References: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3747024b-f3df-09a3-a5a2-33808e5fa42c@gmail.com>
Date: Wed, 8 Dec 2021 16:39:38 +0900
MIME-Version: 1.0
In-Reply-To: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There is a side effect of fancyvrb, or the Verbatim{L|N|U}
environments derived from Verbatim, in that floating "listing"
environments placed just next to chapter/section headings are
treated as page/column-break candidates, and results in a widowed
heading.

Other floating objects such as "figure" and "table" do not
have this issue as long as they are free of fancyvrb.

Add tests to detect "listing" environments who come next to
\chapter/\section/\subsection/... commands.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/cleverefcheck.pl | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
index 0085fdb5..f46cd89f 100755
--- a/utilities/cleverefcheck.pl
+++ b/utilities/cleverefcheck.pl
@@ -25,8 +25,11 @@ my $IX_ptn = qr/(^|\s+)IX[^\s\{]*{/ ;
 my $api_ptn = qr/(^|\s+)api[^\s\{]*{/ ;
 my $ppl_ptn = qr/(^|\s+)ppl[^\s\{]*{/ ;
 my $acr_ptn = qr/(^|\s+)[aA]cr[^\s\{]*{/ ;
+my $heading_ptn = qr/(\\chapter|\\section|\\subsection|\\subsubsection)/ ;
+my $listing_ptn = qr/\\begin\{(listing|Verbatim)/ ;
 my $in_footnote = 0 ;
 my $footnote_save = 0;
+my $after_heading = 0;
 
 sub check_line {
     my $raw_line = $line;
@@ -102,6 +105,18 @@ sub check_line {
 	    print $ARGV[0], ':', $line_num, ':', $raw_line;
 	}
     }
+    if ($after_heading) {
+	if ($line =~ /^\s*$/) {
+	    # ignore empty/blank line
+	}
+	if ($line =~ /^\s*\{*[A-Za-z0-9]/) {
+	    $after_heading = 0 ;  # normal line, OK
+	}
+	if ($line =~ /$listing_ptn/) {
+	    print $ARGV[0], ':', $line_num, ':', $raw_line, "^^^ listing next to heading ^^^\n";
+	    $after_heading = 0 ;
+	}
+    }
     if ($line =~ /$Verbatim_end/) {
 	$skip = 0;
     } else {
@@ -135,6 +150,9 @@ sub check_line {
 	    }
 	}
     }
+    if ($line =~ /$heading_ptn/) {
+	$after_heading = 1 ;
+    }
 }
 
 open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
-- 
2.17.1


