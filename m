Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-it0-f49.google.com ([209.85.214.49]:50524 "EHLO
 mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1731152AbeGWClq (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 22
 Jul 2018 22:41:46 -0400
Received: by mail-it0-f49.google.com with SMTP id w16-v6so21863324ita.0 for
 <perfbook@vger.kernel.org>; Sun, 22 Jul 2018 18:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to;
 bh=fXKUycQ57xu9c9ajWqBE6QNY8gjjNgv4FgGe0Mv16Us=;
 b=CFPLCbkJfcGwpgC6aWo6QZzFEIppYduYnA0+xE/hCIxLlOdEtO+pCn4iXG91ha5KhT
 COz5lkYTYBxJ9XDcPaEmzd1SvYrl9W2RGVrcX4oSr5Yzp9ah9DZTd8Ckt2W89uIQsBJZ
 JJX/tM34bDh672w25Tt5e51dinVpWMAyfu/gUmE/r2u9ciKnaEjnCA8eG6CSlkczDidk
 90g9EbbiciNayrwZWjD2NYpXnSNMee2T2qinm6IHfupQ8ou869lNrDQTWu3O/rIEBCdZ
 rxL0SbkhUVd6oP3+khMJAtxF1vo+wYIuanpZMoR1s/x7AVcL/srSopujvU76tf2dDD0S
 DRDg==
MIME-Version: 1.0
From: Artem Polyakov <artpol84@gmail.com>
Date: Sun, 22 Jul 2018 18:42:45 -0700
Message-ID: 
 <CAJ2Qj5qej+kBZxpy4cUbKVE3NJAnOSc9FZ5wur_rKVU_rnYhVw@mail.gmail.com>
Subject: Memory barrier pairing question
Content-Type: multipart/alternative; boundary="0000000000001261b00571a0c44f"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

--0000000000001261b00571a0c44f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I have a question about the following scenario (considering POWER arch):

initial { x =3D 0; y =3D 0; }

thread0 {
    x =3D 1;
    lwsync;
    y =3D 1;
}

thread1 {
    a =3D y;
    isync;
    b =3D x;
}

Because "isync" is not a memory barrier this example doesn't have
read/write barrier pairing. However, if I understand correctly, lwsync will
ensure that "x =3D 1" will become visible to thread1 before lwsync is done
and before "y =3D 1" will become visible. So "isync" here can be sort of
control dependency as it ensures that "a =3D y" will be performed before "b=
 =3D
x" and even will flush the pipeline according to POWER9 spec.

Can someone comment on this scenario and tell if I am right or where I am
wrong.

--=20
=D0=A1 =D0=A3=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC, =D0=9F=D0=BE=
=D0=BB=D1=8F=D0=BA=D0=BE=D0=B2 =D0=90=D1=80=D1=82=D0=B5=D0=BC =D0=AE=D1=80=
=D1=8C=D0=B5=D0=B2=D0=B8=D1=87
Best regards, Artem Y. Polyakov

--0000000000001261b00571a0c44f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>I have a question about the following scenario =
(considering POWER arch):</div><div><br></div><div>initial { x =3D 0; y =3D=
 0; }</div><div><br></div><div>thread0 {</div><div>=C2=A0 =C2=A0 x =3D 1;<b=
r clear=3D"all"><div>=C2=A0 =C2=A0 lwsync;</div><div>=C2=A0 =C2=A0 y =3D 1;=
</div><div>}</div><div><br></div><div>thread1 {</div><div>=C2=A0 =C2=A0 a =
=3D y;</div><div>=C2=A0 =C2=A0 isync;</div><div>=C2=A0 =C2=A0 b =3D x;</div=
><div>}</div><div><br></div><div>Because &quot;isync&quot; is not a memory =
barrier this example doesn&#39;t have read/write barrier pairing. However, =
if I understand correctly, lwsync=C2=A0will ensure that &quot;x =3D 1&quot;=
 will become visible to thread1 before lwsync=C2=A0is done and before &quot=
;y =3D 1&quot; will become visible. So &quot;isync&quot; here can be sort o=
f control dependency as it ensures that &quot;a =3D y&quot; will be perform=
ed before &quot;b =3D x&quot; and even will flush the pipeline according to=
 POWER9 spec.</div><div><br></div><div>Can someone comment on this scenario=
 and tell if I am right or where I am wrong.</div><div><br></div>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
=D0=A1 =D0=A3=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC, =D0=9F=D0=BE=
=D0=BB=D1=8F=D0=BA=D0=BE=D0=B2 =D0=90=D1=80=D1=82=D0=B5=D0=BC =D0=AE=D1=80=
=D1=8C=D0=B5=D0=B2=D0=B8=D1=87<br>Best regards, Artem Y. Polyakov</div></di=
v></div>

--0000000000001261b00571a0c44f--
