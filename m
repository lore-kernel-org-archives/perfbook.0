Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ZXhnAaJw7fldM4SQiAgWX2dKzwQLqd2watVekCyCICw=;
 b=IY34/tYCJNUhR9TJy4g1R3ebFlCTw7n9dT8W4JO8AomtNkhTdJJoK7IkUUpP9S9jAc
 w1Nt+2X5of0SLVx8hDTK3vDgIao0rWCPIXZhRK4N2NRLBTVk+RZWoZB/ZbQZLewkuBm+
 qjiJtl5m527Wp0UykCq7oJ/C6AjwXHDetrqgzj5hgM+S7FvbjxazkhBPeuHdbRtrvUjD
 WcKJYI6IcLDvwPydC+WFmbgjj5y0lgBMyxbE1ha8lh4GibIlVJ6DeyNtElm34FaiU3+G
 wyzRPD164pyi6kOnAcgKGKvSQKsgV+g1ZoCj7KMb7o4fo+9KkkELVwer5XvVWhqCAITl 7khA==
Subject: Re: [PATCH v2] treewide: Add \noindent where necessary
References: <7080142c-a8de-3fb8-c7e0-de2939730beb@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <309e736b-ba53-5e55-ea23-8fc69959375c@gmail.com>
Date: Tue, 6 Sep 2016 20:17:29 +0900
MIME-Version: 1.0
In-Reply-To: <7080142c-a8de-3fb8-c7e0-de2939730beb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/09/05 23:47:56 +0900, Akira Yokosawa wrote:
>>From 3590a93264e8497f5464397de1644076cd28f467 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 4 Sep 2016 08:01:50 +0900
> Subject: [PATCH v2] treewide: Add \noindent where necessary
> 
> When there is some environment definition just after a section
> heading, the implicit non-indentation of first paragraph is lost.
> 
> This seems inconsistent.
> 
> This commit adds "\noindent"s just before such first paragraphs
> to recover the non-indentation.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Hi Paul,

I'd like to retract this patch.
I suppose you don't like explicit \noindent in the text either.

I prefer fixing the position of first paragraphs in the latex source.
That might cause the variation in position of floating figures, but
should be acceptable.

What do you think?

                                                   Thanks, Akira
                                                

