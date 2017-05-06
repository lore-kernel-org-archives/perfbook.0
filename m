Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33648 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750949AbdEFDk7 (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 5
 May 2017 23:40:59 -0400
Received: by mail-pf0-f194.google.com with SMTP id b23so2792491pfc.0 for
 <perfbook@vger.kernel.org>; Fri, 05 May 2017 20:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OiKJzPbIR33HOxf5LAflADcM1Rtrb6MbKM3ir2oQEEY=;
 b=TdQ9KzAUkhxow1WEEpt9r+tZtucGKBpCpEYyiiK1AGWtmaUk/HjG5pLfPYW9et49sN
 EmQfSK/+yig6NZ+nF3ZB8oqPxqSYM8BhXKF+rkrjeQ9UiUyI0arL0H9JufKoYo4qEXtK
 90mGM9hzUWheILenBJxAuqPmIsz0EHbaWVKAp2lZ3KbosoS6Oxnp/cSJznxcGcbEAiwC
 BtsH52GD5mtIXl2/2LfwidLFg4ydd6RQADfLGs/j+fLok47ZFa2oyPZk2F72Lq1gvpOZ
 Vx95B+huT/iPsflBhCYYavPMFXI1Xv/2Oz+81KVVE3Xgkxnj7xXkoL+XR7Fao6AyjL0L
 xtkw==
Received: from HP ([110.64.91.54]) by smtp.gmail.com with ESMTPSA id
 i73sm16796328pfi.131.2017.05.05.20.40.55 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Fri, 05 May
 2017 20:40:56 -0700 (PDT)
Date: Sat, 6 May 2017 19:40:40 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: [Q] how to break a concurrent program without proper use of MB
Message-ID: <20170506114038.GA12643@HP>
References: <20170505131821.GA13604@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170505131821.GA13604@master>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

On Fri, May 05, 2017 at 09:18:21PM +0800, Yubin Ruan wrote:
> Hi,
> As mentioned in the perfbook, without proper use of memory barrier, concurrent
> program will be error prone. For example, in this program:
> 
>     int a=0;
>     int b=0;
>     
>     void* T1(void* dummy)
>     {
>         a = 1;
>         b = 1;
>         return NULL;
>     }
>     
>     void* T2(void* dummy)
>     {
>         while(0 == b)
>             ;
>         assert(1 == a);
>         return NULL;
>     }
>     
>     int main()
>     {
>         pthread_t threads[2] = {PTHREAD_ONCE_INIT, PTHREAD_ONCE_INIT};
> 
>         pthread_create(&threads[0], NULL, T1, NULL);
>         pthread_create(&threads[1], NULL, T2, NULL);
> 
>         pthread_join(threads[0], NULL);
>         pthread_join(threads[1], NULL);
> 
>         return 0;
>     }
> 
> there is chances that the assertion in T2 would fail, because there is no MB used
> in the program.
> 
> However, after testing it so many times, the assertion never get throwed.
> 
> Adding a loop to increase the chance:
> 
>         for(int i=0; i< 500; i++){
>             a = b = 0;
>     
>             pthread_create(&threads[0], NULL, T1, NULL);
>             pthread_create(&threads[1], NULL, T2, NULL);
>     
>             pthread_join(threads[0], NULL);
>             pthread_join(threads[1], NULL);
>         }
> 
> the result is the same.
> 
> How can I make the assertion fail? Any trick?
> (and I am using a X64 laptop)

I think I find the solution. :)
The problem with the approach above is that on X86/X64
    "Stores are not reordered with other stores"

After changing to this schema:

    processor 1 |  processor 2
    -------------------------
    mov [x], 1  | mov [y], 1
    mov r1, [y] | mov r2, [x]

I can demonstrate the re-odering issue, because according to the Intel arch'
manual[1], "Loads may be reordered with older stores to different locations"

Regards,
Yubin

[1]: https://software.intel.com/en-us/articles/intel-sdm
