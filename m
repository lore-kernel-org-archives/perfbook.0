Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:56206 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbgCLXkz (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 12 Mar 2020 19:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1584056454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=X5xSIa8fHB4x9G3vDNvNGvAcyKu+m4TKCRkTEujur+k=;
        b=g56tm71AXZ2qlqV0m6i1ILaZ+oaIOmcFVmfxyD4+WY42xU9YPvHx0lI4FWK++gWI+galxN
        4MFTtd6xVVWucSgigUJZ1CdB4hYEG78euXEPIY3MEjRgvG2MQ0oR/T8DAW08B1oH4UiZiW
        hnMs558NrQLcF4Xsk56tsAi4CCpC7iQ=
From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] Fix a typo in the quick quiz in chapter 1
Date: Fri, 13 Mar 2020 00:40:48 +0100
Message-Id: <20200312234048.31152-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

s/through to book/through the book/

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 howto/howto.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index c8c895010163..39356eec5062 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -201,7 +201,7 @@ Here are a few possible strategies:
 	has lots of good material as well.
 	This is an eminently reasonable approach if your main
 	goal is to gain a general understanding of the material
-	or if you are skimming through to book to find a
+	or if you are skimming through the book to find a
 	solution to a specific problem.
 \item	If you find the Quick Quizzes distracting but impossible
 	to ignore, you can always clone the \LaTeX{} source for
-- 
2.21.0

