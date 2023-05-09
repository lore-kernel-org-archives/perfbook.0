Return-Path: <SRS0=kj+J=A6=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683590762; x=1686182762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aE3CI9Z2bN6jUWcT4tiePVs45RC/3n04GZXwD9S57w=;
        b=QFiAp3KA3ThP597VVPJmB1DFkSmlDKThQjICcigVzarQyCwqhixxE2LmfYeLZjZycK
         FmxzXMmSxExBIXP8HjgtPg1V+3gvTgMgfllV5rdoKcjSOZBcLwghPYajY4TRTOPxrHWZ
         jQdfwEB2JeHmaQHo0kbse6wRqvmrJzwm3sHc1Y4BRE+aijng1c8JhF9U3PAOll933c+3
         jhcYOMp8e02Thur6yB59at2Zaz4C3N2KbAU6/3HpXAEg5K1AdNPRzYJ/Qd79Bvo+ypcw
         MS5mdPDT0s9ikyLkgyBgD6xPQkE5b01d3MEEExBmvpVSoLEYvc+0zlap12XjdHTRHDHw
         9l7A==
Message-ID: <0331e919-4b65-7c3d-0e50-140a31940161@gmail.com>
Date: Tue, 9 May 2023 09:05:57 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] datastruct: Remove outdated content
References: <20230508172748.31803-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230508172748.31803-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

On Mon,  8 May 2023 17:27:48 +0000, Alan Huang wrote:
> The code of resizable hash table has been updated so that it doesn't
> need to compute the hash twice since 2019. Here are some related
> commits:
> 	2ea492b,
> 	2a7f20d,
> 	  ...

Can you say (as recommended in patches to Linux kernel) ?:

    2ea492bbab9d ("datatruct/hash: Don't recompute hashes in hashtab_add()")
    2a7f20d234e7 ("datastruct/hash: Don't recompute hashes in hashtab_del()")

(hashes of 7 chars should be sufficient for perfbook, but our eyes
expect 12 chars ...)

> So, the patch removes the outdated content.

Indeed.

However, -nq builds need additional tweaks appended below (on top).
Can you do a respin with my Rb tag.

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

See qqz.sty's header comment for the format of consecutive QQz's.

        Thanks, Akira

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 9aa04bb5db2e..0242ccc7ba4b 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -2017,10 +2017,10 @@ which could allow the compiler to inline the resulting fixed functions,
 eliminating not only the overhead of the call instruction, but the
 argument marshalling as well.
 
-\QuickQuizE{
+\QuickQuiz{
 	How much do these specializations really save?
 	Are they really worth it?
-}\QuickQuizAnswerE{
+}\QuickQuizAnswer{
 	The answer to the first question is left as an exercise to
 	the reader.
 	Try specializing the resizable hash table and see how much
@@ -2029,7 +2029,7 @@ argument marshalling as well.
 	instead be answered with respect to a specific use case.
 	Some use cases are extremely sensitive to performance and
 	scalability, while others are less so.
-}\QuickQuizEndE
+}\QuickQuizEnd
 
 All that aside, one of the great benefits of modern hardware compared
 to that available when I first started learning to program back in

