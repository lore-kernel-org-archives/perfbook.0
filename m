Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=yaDJf3mpX487S9xFdzw0Fz7i3JGky2ii1A6qYYgAu/E=;
 b=nM7C7y1FI4TNTzbxUxgkyqJCmWI9ZtfTRMtwpSI162n+gtH+IG3KQj2gub7oX/Wkb5
 7/EV/tDL5EyDwmZ8rensgrCppL8AoNUBFUjDpKebBVle1tkM8nRBDSqO1CmtSTRKnUuG
 btflEu4Iy1UpdRLQLqi4V4tMAZHniw1tiFNNnJmDzNXINwScC3OtLNUo4ay31PT7kKXj
 oW2tzqe6W4b5FL9W18ZvLplkMZHiO7OvQOIq8Om4xzDqOiawocEVKqnzsr8POs0XQLPG
 PhiXI9RGIJlAZ0D27r/daj+kuPwANG12qR1ntA05OqGuXfJR6ZinE8ec+HI5cBsW++E6
 SYew==
Subject: Re: [PATCH] defer: Trivial typo fixes
References: <ac22178a-c6c7-14b5-729a-babf4e5ae742@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <23db2556-f9c2-678f-6c1e-eaa27340797f@gmail.com>
Date: Sun, 24 Jul 2016 17:48:00 +0900
MIME-Version: 1.0
In-Reply-To: <ac22178a-c6c7-14b5-729a-babf4e5ae742@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/24 17:39:02 +0900, Akira Yokosawa wrote:
>>From 2d28ff4da3cab75f5a7c771bc49d22e20102ee45 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 24 Jul 2016 17:21:40 +0900
> Subject: [PATCH] defer: Trivial typo fixes
> 
> This commit fixes trivial typos found in Chapter 9.
> It also fixes a redundant blank line at the end of
> Quick Quiz 9.45's Answer.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  defer/defer.tex          | 4 ++--
>  defer/hazptr.tex         | 8 ++++----
>  defer/rcuapi.tex         | 4 ++--
>  defer/rcufundamental.tex | 2 +-
>  defer/refcnt.tex         | 2 +-
>  defer/toyrcu.tex         | 6 +++---
>  6 files changed, 13 insertions(+), 13 deletions(-)
> 

Hi Paul,

If this patch causes conflicts with pending changes in Chapter 9,
I'll do resolution on my side and re-submit v2.

                                           Thanks, Akira

