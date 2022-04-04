Return-Path: <SRS0=JJuA=UO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ixNjvhzwTls20VxfPKX67ukdwprKCYP7mjc3E0JxfyA=;
        b=Y69MJUuXqNx8zTSIzMLH1LBrgf+ACXv8ciP2Lx/DjR5loBXRhkoHfPolxcWG7Mq0MJ
         u+ub/CIzHm8i715vb+0/flyYZYNAmew3xYsABuxB/VNo2o2RLHdMpxEYri0l8WO2MEwo
         8FwVOK5eGEl9A2A8rzcNlDpsYHkF0DgScnddYXa+CrLH2v1IKr8WGGwp/V4LLXotjtao
         +7r/USSjWBxxzNc1PhLgqP7ASLIy/Gq35x86xpyKg7XNm9XgfmLnZjVYuwvrKobKB6+y
         rDHdBDa02j084ie5khTWdb46rZQEKfG+QHLd9cEAnU3YGWhjVdTIOdWOkimvo6nB1dbg
         3eLQ==
Message-ID: <d76d4b1a-9686-d03c-507c-057fd3433837@gmail.com>
Date: Mon, 4 Apr 2022 09:02:00 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/3] punctcheck.pl: Add pattern to catch reverse use
 of period marker
Content-Language: en-US
References: <c1a39b48-6a99-9317-a074-e72bb45b374a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c1a39b48-6a99-9317-a074-e72bb45b374a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

End-of-sentence markers ("\@.", "\@?", etc.) make sense when they
follow uppercase letters.
Mid-sentence markers (".\@", "?\@", etc. ) make sense when they
follow lowercase letters.

Add patterns to cache misuses of them.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/punctcheck.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utilities/punctcheck.pl b/utilities/punctcheck.pl
index 7d23cc57..8820bf9c 100755
--- a/utilities/punctcheck.pl
+++ b/utilities/punctcheck.pl
@@ -91,6 +91,12 @@ sub check_line {
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\\@[\.\?\!\:][\)\}\']*\s+[^%]/){
 	    $ng += 1;
 	}
+	if ($line =~ /[a-z][\)\}\']*\\\@[\.\?\!\:][\)\}\']*\s/) {
+	    $ng += 1;
+	}
+	if ($line =~ /[A-Z][\)\}\']*[\.\?\!\:]\\\@[\)\}\']*\s/) {
+	    $ng += 1;
+	}
 	if ($ng) {
 	    print $ARGV[0], ':', $line_num, ':', $line_raw;
 	}
-- 
2.25.1


