Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=dMC7GW2NXji3gU/499XQWSOkw7dlrVU2IdymtlQc0eg=;
 b=XDYo7QviaEr39vndmFfCU0xYmKJjsGDdtEMCZAYmztgnhFJJXcrnvZy2x6gL2CKS3h
 hpiRt0K6XoysRPkNv7tvFAKYdieQsqjrJ8v52+Wcp2XPm3X3kxvPhXEGMaAgDbJ6xMng
 YRY9wAL+HbvOFjexh67MjkuTJuEwVNqv+JFCBgx1qelKrvnCQukUNBdVf1F/hXVEXZ0H
 p449Zn5kD/E4URSQIANLxvRiyV7bNhFsjnA4Xad6hoYfrT36s7C3To39iRG+mTFD7UcR
 fWi4skD7upaI2zCmzNDcB0rAJvjifFAIBsPGYcwkQudjYGRi6JSeTeEpvYOFSJ/55RC4
 4Y5g==
Subject: Re: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
References: <571C1843.1060906@gmail.com> <571C1C8F.9000602@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571C42A1.8060201@gmail.com>
Date: Sun, 24 Apr 2016 12:50:57 +0900
MIME-Version: 1.0
In-Reply-To: <571C1C8F.9000602@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/24 10:08, Akira Yokosawa wrote:
>>From 6ecb00b37832372d18cdc7ff5eaea9a53eab3cb9 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Sun, 24 Apr 2016 08:19:20 +0900
> Subject: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
> 
> In commit 33b93f8258f5 ("qqz: Cross-link questions and answers"),
> cross-links of quick quizzes and their answers were implemented.
> However it uses the \stepcounter{} command, and direct references
> of 'quickquizctr' counter is not output to the .aux file.
> The symptom is when you click on a hyperlink in the resulting PDF,
> you jump to a random nearby label such as that of Figure, Table,
> or Section, etc. which happens just before the \label{} using
> 'quickquizctr'.
> 
> By using \refstepcounter{} instead and using 2 counters
> 'quickquizctr' and 'quickquizctrC' ('C' stands for 'Chapter'),
> each of which is automatically reset at a new chapter and
> a new section respectively, and defining \theHNum at the head
> of qqz.sty, then redefining it within the \QuickQuizAnsers
> command, matching QQ.n.m's and QQA.n.m's are output to the .aux
> file correctly.
> 
> By applying this change, resulting hyperlinks become to jump to
> places almost exactly where you'd expect.
> 
> This change may have the effect of increasing the required number
> of 'pdflatex' iterations to get a final result. The following
> commit will take care of it.
> 
> This commit also updates the copyright notices in the header,
> including the name of Paolo Bonzini who authored the commit
> mentioned above.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>

Hi, Paul.

I noticed there really is a change in the behavior of hyperref's of
Chapters. They used to jump to the top of the pages, but after
this patch is applied, they jump to the bottom of the Chapter titles.
So you need to scroll a little to see the title of the Chapters.

I think this is a regression caused by this patch.

If you do think so, please keep from pushing this series out.

Or the benefit of the patch is big enough compared to the change
of the behavior?

                                            Regards, Akira

