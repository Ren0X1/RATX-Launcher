using DiscordRPC;
using DiscordRPC.Logging;
using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Threading;
using System.Windows;
using System.Windows.Controls;

namespace Ren0XLauncher
{
    public partial class MainWindow : Window
    {
        String ip;
        String estadoDiscord = "Pantalla Principal";
        String textoFoto;
        String fotoDiscord;
        private static DiscordRpcClient client;
        public MainWindow()
        {
            InitializeComponent();
            CargarCombo();
            CargarPresence();
            DiscordPres();
        }

        private void CargarPresence()
        {
            WebClient client = new WebClient();
            Stream stream = client.OpenRead("https://raw.githubusercontent.com/Ren0X1/VersionCheck/main/discord.txt");
            StreamReader reader = new StreamReader(stream);
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                string[] cadena = line.Split("|");
                textoFoto = cadena[0];
                fotoDiscord = cadena[1];
            }
        }
        private void CargarCombo()
        {
            WebClient client = new WebClient();
            Stream stream = client.OpenRead("https://raw.githubusercontent.com/Ren0X1/VersionCheck/main/ips.txt");
            StreamReader reader = new StreamReader(stream);
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                string[] nombreSolo = line.Split("|");
                ListaServers.Items.Add(nombreSolo[0]);
            }
        }

        private void CambiaServer(object sender, SelectionChangedEventArgs e)
        {
            int index;
            int counter = 0;
            index = ListaServers.SelectedIndex;
            WebClient client = new WebClient();
            Stream stream = client.OpenRead("https://raw.githubusercontent.com/Ren0X1/VersionCheck/main/ips.txt");
            StreamReader reader = new StreamReader(stream);
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                if (index==counter)
                {
                    string[] ipSolo = line.Split("|");
                    ip = ipSolo[1];
                    estadoDiscord = "Jugando "+ipSolo[0];
                    DiscordPres();
                }
                counter++;
            }
        }

        private void LanzarApp(object sender, RoutedEventArgs e)
        {
            if (ip!=null)
            {
                Shell(ip);
            }
        }

        private void Shell(string v)
        {
            Process process = new Process();
            process.StartInfo.FileName = "Explorer.exe";
            process.StartInfo.Arguments = v;
            process.Start();
        }

        private void AbrirAppdata(object sender, RoutedEventArgs e)
        {
            string userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            string[] cadena = userName.Split("\\");
            string path = "/open, C:\\Users\\" + cadena[1] + "\\AppData\\Roaming\\CitizenFX";
            Shell(path);
        }

        private void BorrarCache(object sender, RoutedEventArgs e)
        {
            string path = @"..\FiveM.app\data";
            Directory.Delete(path, true);
        }

        private void BorrarLogs(object sender, RoutedEventArgs e)
        {
            string path = @"..\FiveM.app\logs";
            Directory.Delete(path, true);
        }

        private void BorrarCrash(object sender, RoutedEventArgs e)
        {
            string path = @"..\FiveM.app\crashes";
            Directory.Delete(path, true);
        }
        private void DiscordPres()
        {
            if (client!=null)
            {
                client.Dispose();
            }
            client = new DiscordRpcClient("733532360183775234");
            client.Initialize();
            client.SetPresence(new RichPresence()
            {
                State = estadoDiscord,
                Timestamps = Timestamps.Now,
                Assets = new Assets()
                {
                    LargeImageKey = fotoDiscord,
                    LargeImageText = textoFoto
                }
            });
        }
    }
}