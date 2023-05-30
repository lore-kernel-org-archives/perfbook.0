Return-Path: <SRS0=hS86=BT=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685458818; x=1688050818;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T2FUKd55RcbvbYa0tDGNVpLJ5PC9l5RKD3Rh1MtuyIU=;
        b=k7tV1eXzk0v+XKIr0MWmMamsdgYOIPCiTllmqJ5DxUbAjiyv3Y7+Qo0vfyARfk6ehk
         hRmfvnD+aDfmzNVq+BmPKjfj51E3lgj8hhnA+FzHrxb+mkhA9su1DuurCDgoIkkCa0qa
         49Q9HFN7A2wrXW9q47gx0js0pPVoAA28Dt/v6BqqwG08v0fxVORnCzzzUXRTVzOZOFeU
         P+skWIIwBSUmk0KVLbKzSgI+qVykOUrASaq7UHuAKkYewwbSL3h7fBoOz+50jfymPVEX
         potjTgKbmnIqyMjzVXR/FC3w67j/z+Dy2ax+Jj9amXMTYNhtq97WnxYXFxj+eLewKyCr
         972w==
From: Alan Huang <mmpgouride@gmail.com>
Message-Id: <C381BA67-FF62-4A89-AAB6-3B946B03A96C@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FC255FEE-F3C5-4CF9-8675-167ADE3754D8"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: Question: In what circumstances would the enqueuer fail?
Date: Tue, 30 May 2023 23:00:03 +0800
In-Reply-To: <451e4440-b315-451b-a0ec-e211b219b724@paulmck-laptop>
References: <BC1D7582-8D92-411D-8E61-68252413A1BA@gmail.com>
 <451e4440-b315-451b-a0ec-e211b219b724@paulmck-laptop>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


--Apple-Mail=_FC255FEE-F3C5-4CF9-8675-167ADE3754D8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> 2023=E5=B9=B45=E6=9C=8830=E6=97=A5 08:36=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, May 30, 2023 at 12:48:33AM +0800, Alan Huang wrote:
>> Hi,
>>=20
>> I=E2=80=99m reading 14.2.1.3 Half-NBS Queue, there is one sentence =
says:
>>=20
>> 	The enqueuer might have failed between lines 9 and 10 of the =
listing, so that the element in question is only partially enqueued.
>>=20
>> My question is: In what circumstances would the enqueuer fail between =
lines 9 and 10 ?
>=20
> The following circumstances would do it:
>=20
> o	Someone kills the thread at that point.
>=20
> o	The CPU that the thread is running on takes an interrupt,
> 	but there is an infinite-loop bug in the interrupt handler,
> 	so that the thread's execution is never resumed.
>=20
> o	The CPU that the thread is running on fail-stops, again
> 	preventing that thread from resuming.  (This is rare, but
> 	does occasionally happen, especially on old or thermally
> 	abused hardware.)
>=20
> So nothing normal, if that is what you are asking.  ;-)

Yeah, nothing normal. I often neglect to consider these exceptional =
cases.

Thank you for the explanation!

Thanks,
Alan

>=20
> 							Thanx, Paul


--Apple-Mail=_FC255FEE-F3C5-4CF9-8675-167ADE3754D8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><br><div><blockquote =
type=3D"cite"><div>2023=E5=B9=B45=E6=9C=8830=E6=97=A5 08:36=EF=BC=8CPaul =
E. McKenney &lt;paulmck@kernel.org&gt; =E5=86=99=E9=81=93=EF=BC=9A</div><b=
r class=3D"Apple-interchange-newline"><div><div>On Tue, May 30, 2023 at =
12:48:33AM +0800, Alan Huang wrote:<br><blockquote =
type=3D"cite">Hi,<br><br>I=E2=80=99m reading 14.2.1.3 Half-NBS Queue, =
there is one sentence says:<br><br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>The enqueuer might have failed =
between lines 9 and 10 of the listing, so that the element in question =
is only partially enqueued.<br><br>My question is: In what circumstances =
would the enqueuer fail between lines 9 and 10 ?<br></blockquote><br>The =
following circumstances would do it:<br><br>o<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Someone =
kills the thread at that point.<br><br>o<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>The CPU that the thread is =
running on takes an interrupt,<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>but there is an infinite-loop bug =
in the interrupt handler,<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>so that the thread's execution is =
never resumed.<br><br>o<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>The CPU that the thread is =
running on fail-stops, again<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>preventing that thread from =
resuming. &nbsp;(This is rare, but<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>does occasionally happen, =
especially on old or thermally<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>abused hardware.)<br><br>So =
nothing normal, if that is what you are asking. =
&nbsp;;-)<br></div></div></blockquote><div><br></div><div>Yeah, nothing =
normal.&nbsp;<span style=3D"color: rgba(0, 0, 0, 0.85); font-family: =
&quot;Helvetica Neue&quot;; font-size: 14px;">I often neglect to =
consider these exceptional cases.</span></div><div><span style=3D"color: =
rgba(0, 0, 0, 0.85); font-family: &quot;Helvetica Neue&quot;; font-size: =
14px;"><br></span></div><div><font face=3D"Helvetica Neue"><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85); color: rgba(0, 0, 0, 0.85); =
font-size: 14px;">Thank you&nbsp;for =
the&nbsp;explanation!</span></font></div><div><font face=3D"Helvetica =
Neue"><span style=3D"caret-color: rgba(0, 0, 0, 0.85); color: rgba(0, 0, =
0, 0.85); font-size: 14px;"><br></span></font></div><div><font =
face=3D"Helvetica Neue"><span style=3D"caret-color: rgba(0, 0, 0, 0.85); =
color: rgba(0, 0, 0, 0.85); font-size: =
14px;">Thanks,</span></font></div><div><font face=3D"Helvetica =
Neue"><span style=3D"caret-color: rgba(0, 0, 0, 0.85); color: rgba(0, 0, =
0, 0.85); font-size: 14px;">Alan</span></font></div><br><blockquote =
type=3D"cite"><div><div><br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Thanx, =
Paul<br></div></div></blockquote></div><br></body></html>=

--Apple-Mail=_FC255FEE-F3C5-4CF9-8675-167ADE3754D8--
