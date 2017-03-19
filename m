Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=1k1Mb5LkVmlX8KoavFnpU7bnfLCRiricPVFwCbeMiCU=;
 b=l4e4OcD3Q/XhphRSYr+kU3sO0Ln8CWhfobXg3UBtXHkd1pCLqBp34qpXSLxZXhR+rQ
 IeGgqIHYrC6u0bVsCZ5pVQmk6ZdGemjUAOfjLM/HfxTXYv52i4ZFV0sEbrrPqmLmMc09
 Lr7DZIFBeP6c14t7P0UYEQrEA1EBTHX3k1tznyx+XYkzy8TyTaHV96v/VswYYDyLHCRO
 Fi2LVgnc6o1eN3ljNAg/h8vOyLMpjKpXn7bbjvG2EiIGLL4Mwg1MitgfFstxwpbXNF68
 JIf9Fm6iw7cz/S3CGNWMUVnIGSiUFYM0LwiRTpDbbJHxMTyj5xBrDR3uXkmMlYsdG6EM
 KPlA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] whymb: Convert to 'description' lists
Message-ID: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
Date: Mon, 20 Mar 2017 00:44:12 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e29e397c3eab7359cdd866d5a59a0af56dfd22c4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 20 Mar 2017 00:25:49 +0900
Subject: [PATCH 0/6] whymb: Convert to 'description' lists

Hi Paul,

This series converts some of "itemize" and "enumerate" lists in whymb
to "description" lists. In the fairly old commit 433c1ff9f545 ("pdflatex
apparently doesn't like complex item parameters"), "description" lists
were converted to "itemize" lists, but I don't see what went wrong.

Can you try this?

                                       Thanks, Akira
--
Akira Yokosawa (6):
  whymb: Convert to 'description' (part 1)
  whymb: Convert to 'description' (part 2)
  whymb: Convert to 'description' (part 3)
  whymb: Use 'nextline' style for 'description'
  whymb: Convert to 'description' (part 4)
  whymb: Convert to 'description' (part 5)

 appendix/whymb/whymemorybarriers.tex | 113 ++++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 56 deletions(-)

-- 
2.7.4

