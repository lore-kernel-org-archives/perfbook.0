Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gDyg8vw8LdRPRrd1uwOz05okMyzYF9MVoBx8RiTZApk=;
        b=KPhIpeDjnbFAcJufqWk2WoA9Iuxpyrb0XT20tnHUJ3MSbfyqAQYbUnoYOMuo8VneKA
         rZmcdPMPysTkPWWEdjMR9o8888gB2t/pyGr0NhpM1oV+4FzUFC3GRvk+PvqEYQfd9I6n
         bWpOPl+UqmEViSaYu4M/NYd++pKL2ueAZzs/qUeuSSWbVW3Phmw4BmBB49so05aYFJWF
         ZlN5Whb+U16HOKI9w6YtfvAPgY/Ela5yWXgCe1b/Lo9Xysfmwhs0/kCQjvkrF4SYxI9r
         hsPNC1oFLe/TZ6phOfBnW+N/W7TXY7mJbsw1ztBkVU+gQ+RYD07OCj6HXdUGi5cHuO30
         U5ow==
Subject: Re: [PATCH] count: Include atomic_nehalem.pdf instead of
 atomic_nehalem.png
References: <38fa0336-1150-7e92-bc00-b094b959f932@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <482c35de-949b-9bb1-4d96-dd6972ee3430@gmail.com>
Date: Wed, 5 Dec 2018 20:56:16 +0900
MIME-Version: 1.0
In-Reply-To: <38fa0336-1150-7e92-bc00-b094b959f932@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/12/05 20:00, Akira Yokosawa wrote:
> From 213fcdaabb6daa14c1c6cfc6ff780d023478d59f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 5 Dec 2018 19:48:32 +0900
> Subject: [PATCH] count: Include atomic_nehalem.pdf instead of atomic_nehalem.png
> 
> Without any suffix specified, \includegraphics{} prefers .png to .pdf
> by default.
> 
> Fixes: 04e270767c34 ("count: Restore 'fig:count:Atomic Increment Scalability on Nehalem'")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This is a "minor fix".  Obviously, I missed to check the restored figure
> before submitting the previous patch set. ;-)

Looks like this depends on TeX Live version. .png was included on
Ubuntu Trusty's TeX Live 2013/Debian.

On Ubuntu Bionic (TeX Live 2017/Debian), .pdf is included both with and
without this fix.

        Thanks, Akira

> 
>         Thanks, Akira
> --
>  count/count.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index 6fd54b5..bdbc4cd 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -248,7 +248,7 @@ accuracies far greater than 50\,\% are almost always necessary.
>  
>  \begin{figure}[tb]
>  \centering
> -\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic_nehalem}}
> +\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic_nehalem.pdf}}
>  \caption{Atomic Increment Scalability on Nehalem}
>  \label{fig:count:Atomic Increment Scalability on Nehalem}
>  \end{figure}
> 

