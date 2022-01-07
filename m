Return-Path: <SRS0=fMf1=RX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=qEAqgmDBH/FugqiTGHwocrXmgMX/I1L3M5puXIFkdak=;
        b=nyym6VcW9C1hkThRO+M3e9cmSR+0Fj4sQ2Vkl1iGTk0kObuJIbyxp5j6eE6f8FTXdQ
         mlGZwckJhF/5EmndaIDlecZMxn5S2uAYvd4wKq5h77DVMRr/Il1twtrMSFL/HiNpzCo/
         6guMSaE7GFeKY4IhUiDGJC1Owc94XwXVTijWe48VDg16h2x7MYYuyRso/UyJWfXQgd/Y
         Rm005oA25ckhfEK2OWjqInsMy3dnwl0zDCruh9jhxxe5NAuGiZiSfuAkhb8VQHXg4KcF
         w1W6tLoHo2VTr24G/TV2oJYblD1OZ52iBWupFf3T3lrLqRKk2bjncx7IrAVjO7phtQge
         rkBw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] punctcheck.pl: Fix false positive by stricter
 pattern for \acr{}
Message-ID: <29dac258-de72-0b10-3778-4e34fe4005ce@gmail.com>
Date: Fri, 7 Jan 2022 12:48:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A false positive in defer/rcuintro.tex by punctcheck.pl made
Paul do a wrong band-aide change in commit 8e3364bead00
("defer/rcuintro: Fix ThomasEHart2006a punctuation issue.").

It was because the pattern "\{.+\}" matches all of
"{qsbr}~\cite{ThomasEHart2006a}" and the script saw the
sentence as if it ended with "\IXacrfst{}."

Silence the false positive by using a stricter pattern of
"\{[^\}]+\}".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/punctcheck.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/punctcheck.pl b/utilities/punctcheck.pl
index 3488e5b6..7d23cc57 100755
--- a/utilities/punctcheck.pl
+++ b/utilities/punctcheck.pl
@@ -62,7 +62,7 @@ sub check_line {
 	$ng = 0;
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:][\)\}\']*$/ ||
 	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:]\\footnote/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?(f|fst)?\{.+\}[\)\']*[\.\?\!\:][\)\}\']*$/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?(f|fst)?\{[^\}]+\}[\)\']*[\.\?\!\:][\)\}\']*$/ ||
 	    $line_raw =~ /\\[Cc]ref\{(cha|chp)\:app:[^\}]*\}[\.\?\!\:][\)\}\']*$/ ) {
 	    $ng += 1;
 	    if ($next_line =~ /^\s*$/ || $next_line =~ /^\s*%/ ||

base-commit: f21271f0939bb620a95b1bb3d76ac0259c4bb54c
-- 
2.17.1

