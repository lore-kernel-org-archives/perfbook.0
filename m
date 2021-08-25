Return-Path: <SRS0=Ut+l=NQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vO62zjRBv7ZMymB+rWbrNMQLdK4QOS/xHpSSao3lF8I=;
        b=TVv+7lRtSVuZVzDt1SwVaTYTqaRcoBViRgApozU+RdF6ZMjGV4pvT0yq6kEkUGYAON
         fzVT5PdeH/0JUOygdiHyl3DegQu3lKkavA5FpYpqkks1iLLhJ4RqUxF9R7IVSpHtYXWr
         /YcPUpH/fedlUhCcd+vfQVgeblAh8Ipo4u8iHcObkEFApIaFcQr4HhhEKkGtHUbX09cL
         Adv1wkD7vsDD+1Tlfha/kYQm+bx1NsEqDOFDBkGY3ZdtjOTShEqx/MrE283dCgRPtlCU
         jXWO38mxZdPXKsMR4y33oJvtk+ZjojVK2tp+cAVGfODno5sIEG3My8q7m+dysNi2YZ4w
         +z4A==
Subject: [PATCH -perfbook 3/5] punctcheck.pl: Add regex to catch punctuation
 marks after 'Appendix X'
References: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7b8d57df-6754-fcbb-a09f-a082037a12cc@gmail.com>
Date: Wed, 25 Aug 2021 18:40:39 +0900
MIME-Version: 1.0
In-Reply-To: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This regex checks label strings inside \cref{}.
As $line carries an input line with such arguments removed, it is
tested against $line_raw.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/punctcheck.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utilities/punctcheck.pl b/utilities/punctcheck.pl
index 88fd59c0..3488e5b6 100755
--- a/utilities/punctcheck.pl
+++ b/utilities/punctcheck.pl
@@ -62,7 +62,8 @@ sub check_line {
 	$ng = 0;
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:][\)\}\']*$/ ||
 	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:]\\footnote/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?(f|fst)?\{.+\}[\)\']*[\.\?\!\:][\)\}\']*$/ ) {
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?(f|fst)?\{.+\}[\)\']*[\.\?\!\:][\)\}\']*$/ ||
+	    $line_raw =~ /\\[Cc]ref\{(cha|chp)\:app:[^\}]*\}[\.\?\!\:][\)\}\']*$/ ) {
 	    $ng += 1;
 	    if ($next_line =~ /^\s*$/ || $next_line =~ /^\s*%/ ||
 		$next_line =~ /\\item/ ||
-- 
2.17.1


