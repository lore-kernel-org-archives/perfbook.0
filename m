Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EPbVNayW+z5OxGuSMWTvfxCB5wZk8S65UmbBHJTRye4=;
 b=G9WdlI9N2RTOUBfHwVaaJu6+7jwh8kkbDKgTbIYrPdP4/W9IEr7QK3yixqSwbXb4ST
 Cxt9BTaJMyADjD5BBDR9vq+656PNJ53kwhEGzNDD2gww0S6OWNS38DkMY0Huwt86ZRS0
 ExqfnUShu54t/nvyyNHR0zXbUtx5++jIznYyxRQUOQK43kAa9D8QUuYaXRukHM6cp77U
 JFfAw5mbKA5COjew+7JqMSxjEIMAXLHdr8rS/uCqaG6Z93c74WimK4+WrwAtXQ3ZQKzN
 1IlBLUDnJa9yRcxfP2MKUXWMQDIv4AaDmqhFUbzZle+V7T1sqevt4UaPqkjWHJ4PMvH2
 iTgA==
Subject: Re: [PATCH] typo at Chp 7.
References: <20171027092317.GA8509@HP>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bf23f56f-b4e1-48fe-821d-721457cd469e@gmail.com>
Date: Sat, 28 Oct 2017 00:02:19 +0900
MIME-Version: 1.0
In-Reply-To: <20171027092317.GA8509@HP>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Yubin Ruan <ablacktshirt@gmail.com>, perfbook@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Yubin,

On 2017/10/27 18:23, Yubin Ruan wrote:
> Hi paul,
> 
> I finish chapter 7 and find some typo. Fixed in the patch below.
> 
> Yubin
> 
> diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
> index 9fcbbf9..c7c4ae8 100644
> --- a/locking/locking-existence.tex
> +++ b/locking/locking-existence.tex
> @@ -174,7 +174,7 @@ single partitionable data structure such as the hash table shown in the
>  figure, it can be problematic if a given data element can be a member
>  of multiple hash tables or given more-complex data structures such
>  as trees or graphs.
> -These problems can be solved, in fact, such solutions form the basis
> +These problems can be solved. In fact, such solutions form the basis

I'd suggest the following:

+These problems can be solved, in fact, and such solutions form the basis

>  of lock-based software transactional memory
>  implementations~\cite{Shavit95,DaveDice2006DISC}.
>  However,
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> .
> 

And please refer to Section 1.5 of perfbook for the process of contributing
patches.

Here is what Paul told me when I submitted my first patch back in April 2016.

On 2016/04/13 1:00, Paul E. McKenney wrote:
> Akira, in the future, please do use "git format-patch" and also please
> use the Linux-kernel preferred format for referencing commits, as shown
> in the updated commit below.  The idea is to use the first 12 digits of
> the SHA-1 commit ID, followed by the subject line in both quotes and
> parentheses.

You can see the archive of the thread at:

    http://www.spinics.net/lists/perfbook/msg00148.html

       Thanks, Akira            

