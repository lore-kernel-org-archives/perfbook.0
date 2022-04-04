Return-Path: <SRS0=JJuA=UO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6hdlFpSnYQQtwqs+WJCcGDna5eFFRyIvvw74n9mnDHY=;
        b=WknFnmNyhok0QH84rBBWPtZgWZ3K/7uuzo1/BZ23rM5iV9BTcydFYZyl4ttKHksaK/
         TFQSidJP/9xVsNM8ZXfleLXryXeaMI+sHYN+QWBFm05mqbd4RByHe1BUjZ4c8XhKKNPN
         Wb+UGwr4kSb7HaJnpGELu8stMp/E3rPq0IqYxxbk3dqMiFIze5uIKmXwKw+mji39YQXk
         nCHsT6HG5mxA1GL2jh4VmkqjiJ6o6h7pDc+wBoLpRVeMDR8CphNKAsiX7AKwRqUx2w1m
         rlDbsjU0SZZsyy+r0FGcO2niOEkPhCSixG87vZk+AkAXPJyCnM/PP8YmCo42wFWpOFsE
         7j8g==
Message-ID: <f8f45fbf-3bcf-dec5-872b-ac404e1dfd1c@gmail.com>
Date: Mon, 4 Apr 2022 09:18:46 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2 1/3] punctcheck.pl: Add pattern to catch reverse
 use of period markers
Content-Language: en-US
References: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

End-of-sentence markers ("\@.") make sense when they follow
uppercase letters.
Mid-sentence markers (".\@") make sense when they follow
lowercase letters.

Add patterns to cache reverse uses.

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


