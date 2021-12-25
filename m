Return-Path: <SRS0=Z47E=RK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rqOoH50o6LxaQrJ3EipqymiQUHr2ILwElahp+ChIEkw=;
        b=ohTgR/h6aK70FHoAqWsraMMGLauY7knlOemGUZ/X4unNFWmuApUD381aZCHvwVu0ng
         pnaS2b5C2BE6q7bD4AbCFonjuZv9/9gLAum0R5Ae/w/UfaQBRu3nhLssJ5PRXxbTIlir
         r2JTPk9pSvs+7/6Fq7kgQouZ18vvnzByawC7exZ+AH8JBgxm6SjM5OxQOi1TV3jNaDHh
         qaJc4q48CsA6YkHWTuEBn7Oxtpk1fRIAxbyBqRCeHlMFrGZAMbngpJvEAN0fpD3IHAWV
         EJqHplZT+l+KhbrItqxxBht/yxzyOAVitz4OrupIyr3WLASrSMUQw4GQN2ZUHl2PB1ug
         arDQ==
Subject: Re: Draft blog post on v2021.12.21a release of perfbook
References: <20211224205309.GA1015523@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a120d22c-50e4-c74d-8968-81744ad99c2e@gmail.com>
Date: Sat, 25 Dec 2021 09:40:01 +0900
MIME-Version: 1.0
In-Reply-To: <20211224205309.GA1015523@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, sj38.park@gmail.com, bsingharora@gmail.com, shiyn.lin@gmail.com, e2lahav@gmail.com, luyang.co@gmail.com, zhouzhouyi@gmail.com, pat.github@tullmann.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

On Fri, 24 Dec 2021 12:53:09 -0800, Paul E. McKenney wrote:
> Hello!
> 
> I have drafted a blog post for the new release here:
> https://paulmck.livejournal.com/66892.html
> 
> I have also added the epub build to the landing pages:
> https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html

Well, it's not epub as (ebook-size PDF) != EPUB.

Also, there remains the old remark on "horrible results" of such builds.
I think there are still rooms to improve, but it looks mostly reasonable now. 

        Thanks, Akira

> 
> Finally, I updated the Arxiv version at https://arxiv.org/abs/1701.00854.
> This is in "submitted" state, and may take a day or three to become visible.
> 
> In the meantime, please let me know of any errors or omissions!
> 
> I will post to my personal social media in a few days.
> 
> 							Thanx, Paul
> 
