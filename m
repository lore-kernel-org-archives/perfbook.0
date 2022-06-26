Return-Path: <SRS0=y3V1=XB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fHOMsuyGZzWHO/xrGjOSbmOMBIhoUgvJSQ2/aQsCBds=;
        b=R6mPHbD7wVoTY3EkXxKkqq3u2fhGUaV7aOI0BR7T7nO2qftZGF3ka5eM54JNK4ZZ9/
         V4+D2uEuf3sWE0x3+eyjQSV+Ea+OTiLUBoYkHOQ2xDp6BaHpLg6HmAxFkNlCNP3j/cUw
         /qhgxxsHWktPeUCi1bOBMiS63NJgA6hsuwBUJveF0I+ar8MfT6p1zs56Zccl3Y2jvr9j
         avOzHVTqVB9YDtp/T+9AhnYN5rLb8TRz32xGFl4xAZSKTqqtS/OLb908ZySvYYoaaTks
         DeZqwYZCxcppefGS16diYLldZxBbwZIStNOLZkGZNNLW1gNymzuf1E5GhmPX8iiI3AuU
         1fLQ==
Message-ID: <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
Date: Sun, 26 Jun 2022 13:12:21 +0900
MIME-Version: 1.0
Subject: Re: Is parallel programing hard...
Content-Language: en-US
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
 <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Snir, Marc" <snir@illinois.edu>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
List-ID: <perfbook.vger.kernel.org>

On Sat, 25 Jun 2022 20:03:51 -0700, Paul E. McKenney wrote:
> [ Adding the perfbook email list on CC. ]
> 

> On Sun, Jun 26, 2022 at 02:00:40AM +0000, Snir, Marc wrote:
>> Hi:
>> I got a fatal latex error trying to create the pdf on my own. I append
>> below the last lines of the log and the full log. Latex seems to fail
>> soon after \maketitle
> 
> This is a new one on me!
> 
> One workaround is to us int Dockerfile template under the docker/
> subdirectory.  This is described in question 13 in FAQ-BUILD.txt
> in the top-level directory.
> 
> What environment are you running in?  There are quirks for a few
> of them.
> 
>> I send this FYI, in case it might help you; I loaded the pdf file,
>> and this works for me.
> 
> Glad the PDF file worked!
> 
> Which reminds me, it is past time for me to do another release.
> 
>> Thanks for putting all this material on the web.
> 
> Glad you like it, and I hope that it proves helpful!
> 
> 							Thanx, Paul
> 
>> Marc

Hi Marc,

I see in your log, you are using vanilla TeX Live 2022.

I'm regularly building with vanilla TeX Live, and have not seen
such an error.

>>
>>
>>
>>
>>
>> (/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd
>> File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf
>> )
>> LaTeX Font Info:    Font shape `TS1/ntxtlf/m/n' will be
>> (Font)              scaled to size 12.0pt on input line 605.
>> LaTeX Font Info:    Font shape `TS1/ntxtlf/m/n' will be
>> (Font)              scaled to size 8.8pt on input line 605.
>> LaTeX Font Info:    Font shape `TS1/ntxtlf/m/n' will be
>> (Font)              scaled to size 6.6pt on input line 605.
>>
>>
>> ! LaTeX Error: There's no line here to end.

In my build, messages in the log around here proceeds as follows:

(/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd
File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf
)
LaTeX Font Info:    Font shape `TS1/ntxtlf/m/n' will be
(Font)              scaled to size 12.0pt on input line 607.
LaTeX Font Info:    Font shape `TS1/ntxtlf/m/n' will be
(Font)              scaled to size 8.8pt on input line 607.
LaTeX Font Info:    Font shape `TS1/ntxtlf/m/n' will be
(Font)              scaled to size 6.6pt on input line 607.
LaTeX Font Info:    Trying to load font information for T1+lmtt on input line 6
07.

(/usr/local/texlive/2022/texmf-dist/tex/latex/lm/t1lmtt.fd
File: t1lmtt.fd 2015/05/01 v1.6.1 Font defs for Latin Modern
)

I think "Latin Modern" font is one of essential font packages on TeX Live
these days, but do you have the "lm" font package installed on your system?

        Thanks, Akira

>>
>>
>> See the LaTeX manual or LaTeX Companion for explanation.
>> Type  H <return>  for immediate help.
>>  ...
>>
>> l.605 \IfTwoColumn
>>                   {
>> ?
>> ! Emergency stop.
>>  ...
>>
>> l.605 \IfTwoColumn
>>                   {
>> Your command was ignored.
>> Type  I <command> <return>  to replace it with another command,
>> or  <return>  to continue without it.
>>
>>
>>
>>
>>
> 
> 
