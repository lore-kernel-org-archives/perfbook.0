Return-Path: <SRS0=JJuA=UO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6ukWdZuGIImwO04RT0x/dmIfIvjmXLZQJtnWcSpRnnY=;
        b=Y8lFesiQeSqk3nHExKE4id7ob4M/hSL75AnYd/I7LZ9ZfR/HDUlbdKpbMqfG0F5+nh
         chQufmRjQFPwrIw/NSHaFLblSONsZAK9VnD0v26hCfEfkAQzLD+DRc3yGMVRRvcEHc00
         1q467JW753DtdYElkeAn8mMCTWOcBiyYW0eiSsY1PGF4AO65FAeXjA2m6esEXwXE2rtY
         s95M+7OCPjeZbkILNGOpLeiA8ou5knLfUxqzq/Z9CE0UsP+10zX4C5QlTQspHMJxbjQc
         iOxYvHZw2BaZ4h6Q6Q0cnOFH+nODVtSDO0+iDm8E5+MNVPwQ2r26lNLA6m3fvhmmuFyo
         SiGQ==
Message-ID: <9a30d1f1-2144-ac0e-528f-d356672fd125@gmail.com>
Date: Mon, 4 Apr 2022 09:20:00 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2 2/3] punctcheck.pl: Add hints in complaint
 messages
Content-Language: en-US
References: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

To help Paul (and other contributors), print a hint in front of
the violating line.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/punctcheck.pl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/utilities/punctcheck.pl b/utilities/punctcheck.pl
index 8820bf9c..94cbafc9 100755
--- a/utilities/punctcheck.pl
+++ b/utilities/punctcheck.pl
@@ -71,6 +71,8 @@ sub check_line {
 		$next_line =~ /\\E?QuickQuizEnd[BEM]?/ ||
 		$next_line =~ /\\end\{(quot|enum|item|sequ)/ ) {
 		$ng -= 1;
+	    } else {
+		print "vvv Hint: sentence ending with an uppercase needs \"\\\@.\" vvv\n";
 	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z][\)\}\']*[\.\?\!][\)\}\']*\s+[^%]/ ||
@@ -80,21 +82,28 @@ sub check_line {
 	    if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z][\)\}\']*[\.\?\!][\)\}\']*\s+\\\\/ ||
 		$line =~ /^(?=[\s]*+[^%])[^%]*.*[\.:][\)\}\']*\s+\\\\/ ) {
 		$ng -= 1;
+	    } else {
+		print "vvv Hint: end of sentence needs new line vvv\n";
 	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^~]\\cite/) {
 	    $ng += 1;
 	    if ($line =~ /^(?=[\s]*+[^%])[^%]*~\(\\cite/) {
 		$ng -= 1;
+	    } else {
+		print "vvv Hint: \\cite{} needs a \"~\" in front vvv\n";
 	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\\@[\.\?\!\:][\)\}\']*\s+[^%]/){
 	    $ng += 1;
+	    print "vvv Hint: end of sentence needs new line vvv\n";
 	}
 	if ($line =~ /[a-z][\)\}\']*\\\@[\.\?\!\:][\)\}\']*\s/) {
+	    print "vvv Hint: should be \"xxx.\\\@\" vvv\n";
 	    $ng += 1;
 	}
 	if ($line =~ /[A-Z][\)\}\']*[\.\?\!\:]\\\@[\)\}\']*\s/) {
+	    print "vvv Hint: should be \"XXX\\\@.\" vvv\n";
 	    $ng += 1;
 	}
 	if ($ng) {
-- 
2.25.1


