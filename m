Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m2dkhuO6G2udF/ODl70cZGmANBrQsQtyW35NGtxIxkk=;
 b=oB2Zap8s031RcOr3aMd6sk0pvpKyTXPag5oQpzBu67ioWONFmDyU+VEwAenFukAJ6/
 SbyRBmrfK+37shPiak4qtSFYJ3K+xu/wjuVu5eLV8vZYxrybu8TmRk2NR7Z9mbjDKI6x
 b+akuAdsw15GeQiaN5tuJThMEPS/FZTzjrD4Bt+Arr7SpqRKJhb+0k/S4/qo446IyoEq
 4JpRWAHCLWqaP9XVJ+cf5ZMrpJphpH/0liqrGUx/aI//JoO8AXimzSxhyqzFiYX7GCz2
 UJ0fLXqK7+Sr6U4/JuaNjrpTBFdrYazwWXI2/HTGlFOlUJrcGNpdJS1dbFD16qpYhpOB
 59eg==
Subject: Re: [PATCH v2 0/8] Add style guide
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0d257106-5a41-536b-addb-96075babbefc@gmail.com>
Date: Tue, 1 Aug 2017 00:24:48 +0900
MIME-Version: 1.0
In-Reply-To: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/07/31 23:43, Akira Yokosawa wrote:
>>From e35b5bc0c56f255caee91054f05a5dd7b824b5fa Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 31 Jul 2017 23:20:57 +0900
> Subject: [PATCH v2 0/8] Add style guide
> 
> Hi Paul,
> 
> This is the respin I mentioned earlier.
> Patch #2 has a few more changes from v1 to modify strings of package name.
> Other than that, the end result should be the same as v1.
> 
> Note on the status of the floatrow package:
> 
> Current version v0.3b was revised 2009/08/02.
> There has been no update since.
> I'm not sure if upstreaming is possible.

And I tried to send a message to the author's email address given in
the documentation of the package. It resulted in "User unknown".

> 
>         Thanks, Akira
> --
> Akira Yokosawa (8):
>   Localize floatrow.sty as floatrowpf.sty
>   Apply workaround to floatrowpf.sty
>   Define 'listing' environment for style guide
>   styleguide: Add listing environment examples
>   Disable 'floatrow' layout in manually aligned code snippets
>   styleguide: Add example of grouping code snippets
>   styleguide: Add example of preferred table layout using 'booktabs'
>   styleguide: Tweak layout of 'Limitation' table
> 
>  appendix/styleguide/hello.c        |    9 +
>  appendix/styleguide/styleguide.tex |  177 ++++-
>  defer/rcuusage.tex                 |    6 +-
>  floatrowpf.sty                     | 1482 ++++++++++++++++++++++++++++++++++++
>  howto/howto.tex                    |    4 +-
>  perfbook.tex                       |    4 +
>  6 files changed, 1668 insertions(+), 14 deletions(-)
>  create mode 100644 appendix/styleguide/hello.c
>  create mode 100644 floatrowpf.sty
> 

