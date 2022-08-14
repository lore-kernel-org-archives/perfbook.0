Return-Path: <SRS0=FMiI=YS=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wxnQfT7okpvt9RqRSLKwpESiK7RZiONSFulDV0V8274=;
        b=cU46Ejfpq6hguEsXqyPCXVbh2NmZmp3L9j6LkPD6KDRU+tVwNCBA3AYWS3aTwgzF6k
         876UP/JNa8S2c7WTveeBTIZtI6wizIzYO+fmtMHFK/AHg5ha1LJRMJSrPPZ/NWXsZblW
         i82ehzls4n51Ob93dhtoCQ+Dec4WOxzbUtH3RlFRWZJhUO/tmnTlkdSNcp1mQtmpgNDO
         sLdrFerQoTRTOvPUB0hrTfDiz6a3XDvpsa5Z+5XKXt+c457U/LHEpBf6Isgp8afhcFhN
         Wqftmk+/rB7bNZEHTh9du+qP7exxHXRa44Gwkmj0gsXV+0wxC9KQw/5PpO/d/HZYRyZ6
         LM9g==
Message-ID: <b6e578f6-7399-1d0f-a76c-9f3e19ed32c4@gmail.com>
Date: Sun, 14 Aug 2022 06:11:44 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Content-Language: en-CA
References: <20220813114559.2082323-1-e2lahav@gmail.com>
 <4a072f55-a780-d69b-9a74-a5d5aba63b7a@gmail.com>
 <20220813231240.GM2125313@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FXKFnVwoyvRw=xhjTpkzp7ScGngb8yc9VwwTY7FeYJobw@mail.gmail.com>
 <20220813232901.GP2125313@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
In-Reply-To: <20220813232901.GP2125313@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2022-08-13 19:29, Paul E. McKenney wrote:
> On Sat, Aug 13, 2022 at 07:23:40PM -0400, Elad Lahav wrote:
>> I believe that performance is statistically the same, but I will
>> double check. I assume both GCC and C11 end up using the same
>> underlying mechanism for thread-local storage:
>>
>> https://uclibc.org/docs/tls.pdf
>>
>> If not implemented, TLS falls back on pthread_[gs]et_specific(), but
>> again it would be the same for __thread and _Thread_local.
> 
> Sounds likely to me, but I have been surprised before.

Results:

Linux/x86-64, i7-8550U, GCC TLS

elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
n_reads: 408000  n_updates: 689366000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 588.235  ns/update: 0.348146
elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
n_reads: 443000  n_updates: 762876000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 541.761  ns/update: 0.314599
elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
n_reads: 395000  n_updates: 666718000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 607.595  ns/update: 0.359972

Linux/x86-64, i7-8550U, C11 TLS

elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
n_reads: 410000  n_updates: 684880000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 585.366  ns/update: 0.350426
elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
n_reads: 411000  n_updates: 698148000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 583.942  ns/update: 0.343767
elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
n_reads: 409000  n_updates: 704072000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 586.797  ns/update: 0.340874

QNX/aarch64, NXP LX2160A, GCC TLS (emulated)

elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
n_reads: 221000  n_updates: 67876000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 1085.97  ns/update: 3.53586
elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
n_reads: 227000  n_updates: 67901000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 1057.27  ns/update: 3.53456
elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
n_reads: 211000  n_updates: 65043000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 1137.44  ns/update: 3.68987

QNX/aarch64, NXP LX2160A, C11 TLS (emulated)

elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
n_reads: 217000  n_updates: 67814000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 1105.99  ns/update: 3.53909
elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
n_reads: 223000  n_updates: 67860000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 1076.23  ns/update: 3.53669
elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
n_reads: 218000  n_updates: 68116000  nreaders: 1  nupdaters: 1 
duration: 240
ns/read: 1100.92  ns/update: 3.5234

Looking at the disassembly for the QNX binary I realized that it is 
still using the emulated TLS option (i.e., the compiler generates a shim 
layer that uses pthread_[gs]et_specific()). I will need to rebuild the 
compiler with native TLS support and retest, though I doubt it will have 
a significant impact.

In any case, both the native and the emulated TLS options show the same 
results with the GCC and C11 versions.

--Elad
