Return-Path: <SRS0=Nnbh=J3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a3RoxiI9mVKTYYNrcKWT/UwmWOjCTp0P9WlHcWhrgbw=;
        b=iZnhi8cY4EYpch2I7my85G9nkTRjucX4uJMgF7fbP8Ajg7ONfxGNkyZVfOcqKDYSSf
         zxfgpVVD7L+iPHLpS7gyI45aA6eL+1M/NwK4uHfL2YZKNeZI4Y1JH3gO0nZkwTYHgsBw
         YW7YeXB9ogzv+yonNcnjiucbYHu4nHRkrWGbaa0NFe6ZnUeN7xXtGxxwi98VdUehGeVw
         9lJ0D1ODPoJXJCxt4RkqW+//AFZ7uTUb7FFkpOZVnjJQLun4ONcOrZotUxA43GixVHXf
         O44jmijlGoRFEyhm3hxueK3PQPWoB7F3MQRGB8+yDgDlANbSHsEYZrbZRd0nMWGEikOY
         r5mA==
Subject: [PATCH -perfbook 2/4] periodcheck: Add check of '\@.' and '.\@' uses
References: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <efced609-63b4-9023-77ff-f4a4789fefb4@gmail.com>
Date: Fri, 30 Apr 2021 13:53:04 +0900
MIME-Version: 1.0
In-Reply-To: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

"\@." should be at the end of an input line.
".\@" should be in the middle of a line.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/periodcheck.pl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utilities/periodcheck.pl b/utilities/periodcheck.pl
index b1551c44..11313981 100755
--- a/utilities/periodcheck.pl
+++ b/utilities/periodcheck.pl
@@ -64,6 +64,10 @@ sub check_line {
 		$safe = 1;
 	    }
 	}
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*\.\\\@(\s*$|\s*%.*$)/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*\\\@\.\s+[^\s%]+/){
+	    $safe = 0;
+	}
 	unless ($safe) {
 	    print $ARGV[0], ':', $line_num, ':', $line_raw;
 	}
-- 
2.17.1


